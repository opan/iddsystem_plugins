  def registration
    opts          = {
      form_values: params[:registration_members],
      form_name: 'member',
      action: 'registration'
    }

    req_reg       = IddsystemPlugins::Member.registration(opts)

    if req_reg[:data].eql? 'success'
      redirect_to members_path, notice: "Registration success.\nMessage: #{req_reg[:msg]}"
    else
      redirect_to members_path, alert: "Registration failed.\nMessage: #{req_reg[:msg]}"
    end
    
  end