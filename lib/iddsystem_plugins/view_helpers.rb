module IddsystemPlugins
  module ViewHelpers
    def flash_message(opts = {})
      flash.each do |msg_type, message|
        concat(content_tag(:div, "#{msg_type}#{message}"))
      end
      nil
    end
  end
end