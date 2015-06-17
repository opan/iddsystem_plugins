# class IddsystemGenGenerator < Rails::Generators::NamedBase
# ubab subclass NamedBase menjadi Base agar options di generator bisa lebih fleksibel.
class IddsystemGenGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)
  argument :layout_name, :type => :string, :default => "iddsystem_gen", :banner => "layout_name"
  class_option :haml, :banner => "HAML", :type => :boolean, :desc => "Generate HAML for view and SASS for stylesheets."

  def copy_layout
    copy_file "test.rb", "lib/assets/#{layout_name.underscore}.rb"
    template "#{view_language}/test.html.#{view_language}", "app/views/layouts/#{file_name}.html.#{view_language}"
  end

  private

  def file_name
    layout_name.underscore
  end

  def view_language
    options[:haml] ? 'haml' : 'erb'
  end
end
