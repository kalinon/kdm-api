module TestRequest
  extend ActiveSupport::Concern

  def subject_klass
    @subject_klass.constantize
  end

  def subject_key
    subject_klass.to_s.underscore.to_sym
  end

  def body_schema
    {
      type: :object,
      properties: {
        subject_key => obj_schema
      }
    }.deep_symbolize_keys
  end

  def obj_schema
    {
      type: :object,
      properties: obj_properties
    }.deep_symbolize_keys
  end

  def obj_properties
    props = {}
    subject_klass.attribute_types.each do |key, type|
      translated_type = type.class.to_s.demodulize.underscore.to_sym

      puts translated_type.inspect
      # Handle non-swagger types
      props[key] = case translated_type
                   when :time_zone_converter
                     { type: :string }
                   when :date
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
    props.deep_symbolize_keys
  end

  def new_body(properties)
    new_args = {}
    properties.each do |key, type|
      puts "#{key} => #{type}"
      new_args[key] = case key
                      when :id
                        Faker::Number.number(4)
                      when :name
                        Faker::Name.name
                      when :expansion_id
                        1
                      end
    end
    new_args.delete_if { |_key, value| value.nil? }
    { subject_key => new_args }.deep_symbolize_keys
  end

  def test_request
    @subject_klass = to_s.demodulize.singularize

    subject_klass = self.subject_klass
    subject_key = self.subject_key
    body_schema = self.body_schema
    obj_schema = self.obj_schema
    obj_properties = self.obj_properties
    new_body = self.new_body(obj_properties)

    path "/#{subject_key.to_s.pluralize}" do
      get summary: 'fetch list' do
        produces 'application/json'
        response 200, description: 'success'
      end

      post summary: 'create item' do
        produces 'application/json'
        consumes 'application/json'

        parameter 'body', in: :body, schema: obj_schema

        let(:body) { new_body }

        response(201, description: 'successfully created') do
          it 'uses the body we passed in' do
            obj = JSON.parse(response.body)
            expect(obj['name']).to eq(new_body[subject_key][:name])
            expect(obj['safe_name']).to eq(new_body[subject_key][:name].parameterize)
          end
          capture_example
          schema(obj_schema)
        end
      end
    end

    # Path Object
    path "/#{subject_key.to_s.pluralize}/{id}" do
      parameter 'id', in: :path, type: :integer
      let(:id) { 1 }

      get summary: 'fetch item' do
        produces 'application/json'
        response 200, description: 'success', schema: obj_schema
      end

      patch summary: 'update item' do
        produces 'application/json'
        consumes 'application/json'
        parameter 'body', in: :body, schema: body_schema

        let(:body) { { subject_key => { name: 'Update Test Patch' } } }

        response(200, description: 'successfully created') do
          it 'uses the body we passed in' do
            obj = JSON.parse(response.body)
            expect(obj['name']).to eq('Update Test Patch')
            expect(obj['safe_name']).to eq('update-test-patch')
          end

          capture_example
          schema(obj_schema)
        end
      end

      put summary: 'update item' do
        produces 'application/json'
        consumes 'application/json'
        parameter 'body', in: :body, schema: body_schema

        let(:body) { { subject_key => { name: 'Update Test Put' } } }

        response(200, description: 'successfully created') do
          it 'uses the body we passed in' do
            obj = JSON.parse(response.body)
            expect(obj['name']).to eq('Update Test Put')
            expect(obj['safe_name']).to eq('update-test-put')
          end

          capture_example
          schema(obj_schema)
        end
      end

      delete summary: 'delete item' do
        response(204, description: 'successfully deleted')
      end
    end
  end
end
