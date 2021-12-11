require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Tracker
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    config.paths.add File.join('app', 'api'), glob: File.join('**', '*.rb')
    config.autoload_paths += Dir[Rails.root.join('app', 'api', '*')]

    config.time_zone = 'America/Chihuahua'

    config.i18n.default_locale = :es

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de

    config.generators do |g|
      g.orm             :active_record
      g.template_engine :erb
      g.test_framework  :test_unit, fixture: false
      g.stylesheets     false
      g.javascripts     false
      g.helper = false
    end

    # Do not swallow errors in after_commit/after_rollback callbacks.
    config.active_record.raise_in_transactional_callbacks = true

    #midleware to permit request to server
    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins 'localhost:3000','127.0.0.1:3000'
        resource "/api/*",
                 :headers => :any,
                 :methods => [:get, :post, :put, :delete, :options],
        if: proc{|env|  p env['HTTP_HOST'] }         
      end
    end
  end
end
