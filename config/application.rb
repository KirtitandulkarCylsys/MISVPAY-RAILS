require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module MisvpayProject
  class Application < Rails::Application
    config.load_defaults 7.0
    config.autoload_paths += %W(#{config.root}/app/services)
    config.api_only = true
    config.autoload_paths << Rails.root.join('lib')

  end

end
