Rails.application.routes.draw do
  namespace 'api' do    # creates and /api/v1 path, to separate from html. The "versioning" would be the 1st (v1)
    namespace 'v1' do
      resources :quotes
    end
  end
end
