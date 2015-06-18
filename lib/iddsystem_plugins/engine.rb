module IddsystemPlugins
  class Engine < ::Rails::Engine
    isolate_namespace IddsystemPlugins

    # load semua file yang ada didalam folder lib/iddsystem_plugins/
    config.autoload_paths << File.join(IddsystemPlugins.root, 'lib')
    config.generators do |g|
      g.orm             :active_record
      g.template_engine :haml
    end

    # Load view helpers for the base application
    ActiveSupport.on_load(:action_view) do
      require 'iddsystem_plugins/view_helpers'
      ActionView::Base.send :include, IddsystemPlugins::ViewHelpers
    end
  end
end
