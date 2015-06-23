  def activation_registration
    opts          = {
      form_name: 'member',
      project_id: 54,
      action: 'activation_registration',
      q: params[:q]
    }

    act_reg       = IddsystemPlugins::Member.activation_registration(opts)

    if !act_reg[:msg].eql? 'success'
      redirect_to({action: 'index'}, alert: "Account activation failed.\nMessage: #{act_reg[:msg]}") and return
    end
    
    redirect_to({action: 'index'}, notice: 'Your account successfully activated.')
  end
  