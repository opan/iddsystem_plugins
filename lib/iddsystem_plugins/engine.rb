module IddsystemPlugins
  class Engine < ::Rails::Engine
    isolate_namespace IddsystemPlugins

    config.generators do |g|
      g.orm             :active_record
      g.template_engine :haml
    end
  end
end
