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

    def local_ip
      orig, Socket.do_not_reverse_lookup = Socket.do_not_reverse_lookup, true
      UDPSocket.open do |s|
        # s.connect '64.233.187.99', 1
        s.addr.last
      end
      ensure
        Socket.do_not_reverse_lookup = orig
    end
  end
end

require "iddsystem_plugins/engine"
