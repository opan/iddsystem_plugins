module IddsystemPlugins
  class Engine < ::Rails::Engine
    isolate_namespace IddsystemPlugins

    # load semua file yang ada didalam folder lib/iddsystem_plugins/
    config.autoload_paths << File.join(IddsystemPlugins.root, 'lib')
    config.generators do |g|
      g.orm             :active_record
      g.template_engine :haml
    end
  end
end
