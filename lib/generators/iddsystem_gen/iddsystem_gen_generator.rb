# class IddsystemGenGenerator < Rails::Generators::NamedBase
# ubah subclass NamedBase menjadi Base agar options di generator bisa lebih fleksibel.
class IddsystemGenGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)
  desc "Generate registration file for member and customer on IDdSystems environment.\n"+
        "Please pass at least one form_name as argument on the command.\n"+
        "currently only available 2 form_name : customer and member."
  argument :form_name, :type => :string, :default => "default", :banner => "form_name"
  class_option :haml, :banner => "HAML", :type => :boolean, :desc => "Generate HAML for view"

  def generate_file
    if existing_form(file_name)
      template "controller/controller.rb", "app/controllers/#{file_name_plural}_controller.rb"
      
      route "\n#{routes_path}"
    else 
      run 'rails g iddsystem_gen --help'
    end 
  end

  private

  # nama layout yang di passing di argument
  def file_name
    # format underscore, ex: nama_file
    form_name.underscore
  end

  # convert string ke bentuk plural, ex: customer => customers
  def file_name_plural
    file_name.pluralize
  end

  def file_name_camel
    file_name_plural.camelize
  end

  # convert string ke bentuk singular, ex: customers => customer
  def file_name_singular
    file_name.singularize
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
    content.join("\n").strip
    
    # contekan dari nifty ryan bates
    # controller_actions.map do |action|
    #   read_template("#{dir_name}/#{action}.rb")
    # end.join("\n").strip
  end

  def routes_path
    read_template(File.join(root_path,'routes',file_name,'routes.rb'))
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

  def existing_form(file_name)
    path    = File.join(root_path,"actions",file_name)
    # FileTest.exist?(path)
    Dir.exist?(path)
  end
end
