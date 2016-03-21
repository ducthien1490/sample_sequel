require File.expand_path('../boot', __FILE__)

#require 'rails/all'
require 'action_controller/railtie'
require 'action_mailer/railtie'
require 'sprockets/railtie'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module SampleSequel
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de

    # Do not swallow errors in after_commit/after_rollback callbacks.
    #config.active_record.raise_in_transactional_callbacks = true

    # Allowed options: :sql, :ruby.
    config.sequel.schema_format = :sql

    # Whether to dump the schema after successful migrations.
    # Defaults to false in production and test, true otherwise.
    config.sequel.schema_dump = true

    # These override corresponding settings from the database config.
    config.sequel.max_connections = 16
    config.sequel.search_path = %w(mine public)

    config.sequel.load_database_tasks = false

    # If you want to use a specific logger
    config.sequel.logger = Logger.new($stdout)

    #Manage plugins
    config.sequel.after_connect = proc do
      Sequel::Model.plugin :timestamps, update_on_create: true
    end
  end
end
