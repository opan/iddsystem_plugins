  def activation_registration
    opts          = {
      form_name: 'member',
      project_id: 54,
      action: 'activation_registration',
      q: params[:q],
      data: {
        hidden_field: params[:hidden_field],
        profiles: params[:profiles],
        address1: params[:address1],
        address2: params[:address2],
        contact1: params[:contact1],
        contact2: params[:contact2],
        contact3: params[:contact3]
      }
    }
    act_reg       = IddsystemPlugins::Member.request_data(opts)

    if !act_reg[:status].eql? 'success'
      redirect_to a_members_path(:q => params[:hidden_field][:q]), alert: "Account activation failed.\nMessage: #{act_reg[:msg]}" and return
    end
    
    redirect_to({action: 'index'}, notice: 'Your account successfully activated.')
  end
  