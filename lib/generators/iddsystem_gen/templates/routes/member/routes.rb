  resources :members, :only => [:index] do
    collection do 
      post 'registration'
    end
  end
  