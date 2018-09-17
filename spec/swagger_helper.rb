require 'rspec/rails/swagger'
require 'rails_helper'
require 'support/swagger_request'

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
      },
      host: ENV.fetch('SWAGGER_HOST') { '127.0.0.1:3000' },
      basePath: '/api/v1',
      schemes: %w[http],
      securityDefinitions: {
        OAuth2: {
          type: :oauth2,
          flow: :accessCode,
          authorizationUrl: "http://#{ENV.fetch('SWAGGER_HOST') { '127.0.0.1:3000' }}/api/oauth/authorize",
          tokenUrl: "http://#{ENV.fetch('SWAGGER_HOST') { '127.0.0.1:3000' }}/api/oauth/token",
          scopes: {
            read: 'Grants read access',
            write: 'Grants write access',
            admin: 'Grants read and write access to administrative information'
          }
        }
      }
    }
  }
end
