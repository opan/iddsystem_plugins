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
    def root
      File.expand_path('../../', __FILE__)
    end
  end
end

require "iddsystem_plugins/engine"
