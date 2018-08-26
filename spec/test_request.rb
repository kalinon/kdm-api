module TestRequest
  extend ActiveSupport::Concern

  def _subject_klass
    @subject_klass.constantize
  end

  def _subject_key
    _subject_klass.to_s.underscore.to_sym
  end

  def _body_schema
    {
      type: :object,
      properties: {
        _subject_key => _obj_schema
      }
    }.deep_symbolize_keys
  end

  def _obj_schema
    {
      type: :object,
      properties: _obj_properties
    }.deep_symbolize_keys
  end

  def _obj_properties
    props = {}
    _subject_klass.attribute_types.each do |key, type|
      translated_type = type.class.to_s.demodulize.underscore.to_sym

      # Handle non-swagger types
      props[key] = _obj_properties_type(key, translated_type)
    end
    props.deep_symbolize_keys
  end

  def _obj_properties_type(key, translated_type)
    case translated_type
    when :time_zone_converter
      { type: :string }
    when :date
      { type: :string }
    when :enum_type
      {
        type: :string,
        enum: _subject_klass.defined_enums[key].keys
      }
    else
      { type: translated_type }
    end
  end

  def _new_body(properties)
    new_args = {}
    properties.each do |key, _type|
      new_args[key] = new_object_value(key)
    end
    new_args.delete_if { |_key, value| value.nil? }
    { _subject_key => new_args }.deep_symbolize_keys
  end

  def new_object_value(key)
    case key
    when :id
      Faker::Number.number(4)
    when :name
      Faker::Name.name
    when :expansion_id
      1
    end
  end

  def test_request
    @subject_klass = to_s.demodulize.singularize

    args = {
      subject_klass: _subject_klass,
      subject_key: _subject_key,
      body_schema: _body_schema,
      obj_schema: _obj_schema,
      obj_properties: _obj_properties,
      new_body: _new_body(_obj_properties)
    }

    # Path List
    test_path_list(args)

    # Path Object
    test_path_list(args)
  end

  # Tests GET, POST on object list
  def test_path_list(args)
    # Path List
    path "/#{args[:subject_key].to_s.pluralize}" do
      get summary: 'fetch list' do
        produces 'application/json'
        response 200, description: 'success'
      end

      post summary: 'create item' do
        produces 'application/json'
        consumes 'application/json'

        parameter 'body', in: :body, schema: args[:obj_schema]

        let(:body) { args[:new_body] }

        response(201, description: 'successfully created') do
          it 'uses the body we passed in' do
            obj = JSON.parse(response.body)
            vals = args[:new_body][args[:subject_key]]
            expect(obj['name']).to eq(vals[:name])
            expect(obj['safe_name']).to eq(vals[:name].parameterize)
          end
          capture_example
          schema(args[:obj_schema])
        end
      end
    end
  end

  # Tests GET, PATCH, PUT, DELETE on object
  def test_path_object(args)
    path "/#{args[:subject_key].to_s.pluralize}/{id}" do
      parameter 'id', in: :path, type: :integer
      let(:id) { 1 }

      get summary: 'fetch item' do
        produces 'application/json'
        response 200, description: 'success', schema: args[:obj_schema]
      end

      patch summary: 'update item' do
        produces 'application/json'
        consumes 'application/json'
        parameter 'body', in: :body, schema: args[:body_schema]

        let(:body) { { args[:subject_key] => { name: 'Update Test Patch' } } }

        response(200, description: 'successfully created') do
          it 'uses the body we passed in' do
            obj = JSON.parse(response.body)
            expect(obj['name']).to eq('Update Test Patch')
            expect(obj['safe_name']).to eq('update-test-patch')
          end

          capture_example
          schema(args[:obj_schema])
        end
      end

      put summary: 'update item' do
        produces 'application/json'
        consumes 'application/json'
        parameter 'body', in: :body, schema: args[:body_schema]

        let(:body) { { args[:subject_key] => { name: 'Update Test Put' } } }

        response(200, description: 'successfully created') do
          it 'uses the body we passed in' do
            obj = JSON.parse(response.body)
            expect(obj['name']).to eq('Update Test Put')
            expect(obj['safe_name']).to eq('update-test-put')
          end

          capture_example
          schema(args[:obj_schema])
        end
      end

      delete summary: 'delete item' do
        response(204, description: 'successfully deleted')
      end
    end
  end
end
