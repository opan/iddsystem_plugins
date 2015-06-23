  resources :members, :only => [:index] do
    collection do 
      post 'registration'
      get 'a' => 'members#activation_registration'
    end
  end
  