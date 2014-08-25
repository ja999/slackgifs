Slackgifs::Application.routes.draw do
  resources :gifs do
    collection do
      get :search
    end
  end
end
