  resources :members, :only => [:index] do
    collection do 
      post 'registration'
      get 'a' => 'members#pre_activation'
      post 'activation' => 'members#activation_registration'
    end
  end
  