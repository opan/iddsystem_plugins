  def check_signin
    opts          = {
      form_name: 'member',
      project_id: 54,
      action: 'check_signin',
      data: params[:signin_members]
    }

    data_res      = IddsystemPlugins::Member.request_data(opts)

    if data_res[:status].eql? 'success'
      redirect_to root_url, notice: data_res[:msg]
    else
      flash[:notice] = data_res[:msg]
      redirect_to signin_members_path 
    end
    
  end
  