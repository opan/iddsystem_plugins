  resources :members, :only => [:index] do
    collection do 
      post 'registration'
      get 'a' => 'members#pre_activation'
      post 'activation' => 'members#activation_registration'
      get 'signin' => 'members#signin'
      post 'check_signin' => 'members#check_signin'

    end
  end
  