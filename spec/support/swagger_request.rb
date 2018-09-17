module SwaggerRequest
  def subject_klass
    @subject_klass ||= @metadata[:described_class]
  end

  def subject_key
    @subject_key ||= subject_klass.to_s.underscore.tr('/', '_').to_sym
  end

  def subject_url
    @subject_url ||= subject_klass.to_s.underscore.pluralize.to_sym
  end

  def obj_properties_type(key, translated_type)
    case translated_type
    when :time_zone_converter
      { type: :string }
    when :date
      { type: :string }
    when :mysql_string
      { type: :string }
    when :enum_type
      {
        type: :string,
        enum: subject_klass.defined_enums[key].keys
      }
    else
      { type: translated_type }
    end
  end

  def obj_properties
    props = {}
    subject_klass.attribute_types.each do |key, type|
      translated_type = type.class.to_s.demodulize.underscore.to_sym

      # Handle non-swagger types
      props[key] = obj_properties_type(key, translated_type)
    end
    props.deep_symbolize_keys
  end

  def obj_schema
    @obj_schema ||= {
      type: :object,
      properties: obj_properties
    }.deep_symbolize_keys
  end

  def body_schema
    @body_schema ||= {
      type: :object,
      properties: {
        subject_key => obj_schema
      }
    }.deep_symbolize_keys
  end

  def new_body
    @new_body ||= { subject_key => attributes_for(subject_key) }.deep_symbolize_keys
  end

  def update_body
    up_body = new_body.clone
    up_body[subject_key].each do |key, value|
      up_body[subject_key][key] = "new-#{key}" if value.is_a?(String)
    end
    up_body
  end

  def req_args
    @req_args ||= {
      subject_klass: subject_klass,
      subject_key: subject_key,
      subject_url: subject_url,
      body_schema: body_schema,
      obj_schema: obj_schema,
      obj_properties: obj_properties,
      new_body: new_body,
      update_body: update_body
    }
  end

  # Tests GET, POST on object list
  def test_path_list(args)
    let!(:application) { Doorkeeper::Application.create!(name: 'MyApp', redirect_uri: 'https://app.com') }
    let!(:user) { User.create!(username: 'ax', email: 'ax@b.com', password: 'abc123', password_confirmation: 'abc123') }
    let!(:token) { Doorkeeper::AccessToken.create!(application_id: application.id, resource_owner_id: user.id, scopes: 'read admin') }

    # Path List
    path "/#{args[:subject_url]}" do

      parameter 'Authorization', in: :header, type: :string, required: true
      let(:Authorization) { "Bearer #{token.token}" }

      get summary: 'fetch list', security: [{ OAuth2: [:read] }] do

        produces 'application/json'
        tags args[:subject_key]
        response 200, description: 'success'
      end

      post summary: 'create item', security: [{ OAuth2: [:write, :admin] }] do
        produces 'application/json'
        consumes 'application/json'
        tags args[:subject_key]

        parameter 'body', in: :body, schema: args[:obj_schema]
        let(:body) { args[:new_body] }

        response(201, description: 'successfully created') do
          it 'uses the body we passed in' do
            obj = JSON.parse(response.body).symbolize_keys
            vals = args[:new_body][args[:subject_key]]
            vals.keys do |key|
              expect(obj[key]).to eq(vals[key])
            end
          end
          capture_example
          schema(args[:obj_schema])
        end
      end
    end
  end

  # Tests GET, PATCH, PUT, DELETE on object
  def test_path_object(args)
    before do
      create(args[:subject_key])
    end

    path "/#{args[:subject_url]}/{id}" do
      parameter 'id', in: :path, type: :integer
      let(:id) { args[:subject_klass].first.id }

      parameter 'Authorization', in: :header, type: :string
      let(:Authorization) { "Bearer #{token.token}" }

      get summary: 'fetch item', security: [{ OAuth2: [:read] }] do
        produces 'application/json'
        tags args[:subject_key]
        response 200, description: 'success', schema: args[:obj_schema]
      end

      patch summary: 'update item', security: [{ OAuth2: [:write, :admin] }] do
        produces 'application/json'
        consumes 'application/json'
        tags args[:subject_key]
        parameter 'body', in: :body, schema: args[:body_schema]

        let(:body) { args[:update_body] }

        response(200, description: 'successfully created') do
          it 'uses the body we passed in' do
            obj = JSON.parse(response.body).symbolize_keys
            vals = args[:update_body][args[:subject_key]]
            vals.keys do |key|
              expect(obj[key]).to eq(vals[key])
            end
          end

          capture_example
          schema(args[:obj_schema])
        end
      end

      put summary: 'update item', security: [{ OAuth2: [:write, :admin] }] do
        produces 'application/json'
        consumes 'application/json'
        tags args[:subject_key]

        parameter 'body', in: :body, schema: args[:body_schema]
        let(:body) { args[:update_body] }

        response(200, description: 'successfully created') do
          it 'uses the body we passed in' do
            obj = JSON.parse(response.body).symbolize_keys
            vals = args[:update_body][args[:subject_key]]
            vals.keys do |key|
              expect(obj[key]).to eq(vals[key])
            end
          end

          capture_example
          schema(args[:obj_schema])
        end
      end

      delete summary: 'delete item', security: [{ OAuth2: [:write, :admin] }] do
        tags args[:subject_key]
        response(204, description: 'successfully deleted')
      end
    end
  end

  RSpec.configuration.extend self
end

RSpec.shared_examples 'swagger requests' do |parameter|
  @subject_klass = parameter
  @req_args = {
    subject_klass: subject_klass,
    subject_key: subject_key,
    subject_url: subject_url,
    body_schema: body_schema,
    obj_schema: obj_schema,
    obj_properties: obj_properties,
    new_body: new_body,
    update_body: update_body
  }

  # Path List
  test_path_list(@req_args)

  # Path Object
  test_path_object(@req_args)
end
