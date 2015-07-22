module IddsystemPlugins
  module ViewHelpers
    def flash_message(opts = {})
      flash.each do |msg_type, message|
        concat(content_tag(:div, "#{message}"))
      end
      nil
    end
  end
end