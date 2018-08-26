require 'rspec/rails/swagger'
require 'rails_helper'
require 'test_request'

RSpec.configure do |config|
  # Specify a root directory where the generated Swagger files will be saved.
  config.swagger_root = Rails.root.to_s + '/swagger'

  # Define one or more Swagger documents and global metadata for each.
  config.swagger_docs = {
    'v1/swagger.json' => {
      swagger: '2.0',
      info: {
        title: 'KDM API V1',
        version: 'v1'
      }
    }
  }

  config.extend TestRequest
end
