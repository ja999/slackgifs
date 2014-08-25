Slackgifs::Application.routes.draw do
  resources :gifs do
    collection do
      get :search
      get :single_response_search
    end
  end
end
