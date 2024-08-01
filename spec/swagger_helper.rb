require 'rails_helper'

Rswag::Specs::SwaggerRoot.configure do |config|
  config.swagger_root = Rails.root.to_s + '/swagger'
end

Rswag::Specs::SwaggerConfig.configure do |config|
  config.swagger_docs = {
    'v1/swagger.json' => {
      openapi: '3.0.1',
      info: {
        title: 'API V1',
        version: 'v1'
      },
      paths: {}
    }
  }
end

Rswag::Ui.configure do |config|
  config.swagger_endpoint '/api-docs/v1/swagger.json', 'API V1 Docs'
end