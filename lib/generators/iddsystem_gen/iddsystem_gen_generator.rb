# class IddsystemGenGenerator < Rails::Generators::NamedBase
# ubab subclass NamedBase menjadi Base agar options di generator bisa lebih fleksibel.
class IddsystemGenGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)
  argument :layout_name, :type => :string, :default => "iddsystem_gen", :banner => "layout_name"
  class_option :haml, :banner => "HAML", :type => :boolean, :desc => "Generate HAML for view"

  def generate_file
    template "views/#{view_language}/test.html.#{view_language}", "app/views/test/#{file_name}.html.#{view_language}"
    template "controller/customer/controller.rb", "app/controllers/customers_controller.rb"
    template "controller/member/controller.rb", "app/controllers/members_controller.rb"
    template "views/#{view_language}/test.html.#{view_language}", "app/views/layouts/#{file_name}.html.#{view_language}"
  end

  private

  def file_name
    layout_name.underscore
  end

  # membaca options atau argumen yang di passing ex: --haml
  def view_language
    options[:haml] ? 'haml' : 'erb'
  end

  # untuk baca action/method apa yang ingin di masukkan kedalam template controller.
  def controller_methods(dir_name)
    content = []
    Dir["#{root_path}/#{dir_name.to_s}/*rb"].each do |file|
      content << read_template("#{root_path}/#{dir_name.to_s}/#{action_file_name(file)}.rb")
    end
    # contekan dari nifty ryan bates
    # controller_actions.map do |action|
    #   read_template("#{dir_name}/#{action}.rb")
    # end.join("\n").strip
  end

  # untuk dapatkan nama file action
  def action_file_name(file)
    File.basename(file, ".*")
  end

  # membaca file berformat .rb
  def read_template(relative_path)
    ERB.new(File.read(relative_path), nil, '-').result(binding)
  end

  # mendapatkan root path template iddsystem_gen
  def root_path
    File.expand_path('../templates', __FILE__)
  end
end
