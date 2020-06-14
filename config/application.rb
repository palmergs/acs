require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

# Acs is the main application module for this rails app
module Acs
  # Override application level configuration
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins '*'
        resource '/api/', headers: :any, methods: %i[get post options]
      end
    end

    # 20200614 if you use pg_search features you need to switch to SQL format
    # config.active_record.schema_format = :sql
  end
end
