require File.expand_path('../boot', __FILE__)

require 'rails/all'

Bundler.require(:default, Rails.env)

module Slackgifs
  class Application < Rails::Application

    config.autoload_paths << Rails.root.join('lib/parsers')
  end
end
