require "coffee-rails"
require "sass-rails"
require "jquery-rails"
require 'haml-rails'
require 'haml'
require 'bcrypt'
require 'dynamic_form'
require 'kaminari'
require 'ransack'

module IddsystemPlugins
  class << self
    def hello_world
      p "hello_world"
    end
  end
end

require "iddsystem_plugins/engine"
