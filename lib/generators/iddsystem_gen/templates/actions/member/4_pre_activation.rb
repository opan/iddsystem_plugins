  def pre_activation
    opts          = {
      form_name: 'member',
      project_id: 54,
      action: 'pre_activation',
      q: params[:q]
    }

    data_res      = IddsystemPlugins::Member.request_data(opts)
    @adm_params   = JSON.parse(data_res[:data]['adm_params'])
    @bp_email     = @adm_params['form_values']['bp_email']
    @form_values  = @adm_params['form_values'].except!('password','confirm_password').to_json

    @is_institusi = data_res[:data]['is_institusi'].map{|f| [f['lov_name'],f['lov_val_i'],{class: "#{f['lov_val_s']}"}]}
    @country      = data_res[:data]['country'].map{|f| [f['country_name'],f['country_id']]}
    @city         = data_res[:data]['city'].map{|f| [f['city_name'],f['city_id']]}
    @dept_id      = data_res[:data]['dept_id'].map{|f| [f['lov_name'],f['lov_id']]}
    @state        = data_res[:data]['state'].map{|f| [f['state_name'],f['state_id']]}
    @salutation   = data_res[:data]['salutation'].map{|f| [f['lov_name'],f['lov_val_i']]}
  end
