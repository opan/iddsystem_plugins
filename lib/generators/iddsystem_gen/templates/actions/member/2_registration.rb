  def registration
    opts          = {
      form_values: encode_sensitive_key(params[:registration_members]),
      form_name: 'member',
      action: 'registration',
      project_id: 54, # project id di ncs-e sudah static
      url_activation: "http://#{HOSTWEB}:#{PORTWEB}/members/a"
    }

    req_reg       = IddsystemPlugins::Member.registration(opts)

    if req_reg[:status].eql? 'success'
      redirect_to members_path, notice: "Registration success.\nMessage: #{req_reg[:msg]}"
    else
      redirect_to members_path, alert: "Registration failed.\nMessage: #{req_reg[:msg]}"
    end
    
  end
