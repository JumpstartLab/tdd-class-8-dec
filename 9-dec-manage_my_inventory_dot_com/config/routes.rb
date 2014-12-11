ManageMyInventoryDotCom::Application.routes.draw do
  resources :merchants
  get '/search' => 'items#search', as: :search # search_path, search_url
  root to: 'merchants#index'

  match ':controller(/:action(/:id))(.:format)', constraints: Proc.new { |route_params, request|
    # Record anything that hits the legacy route so that we know what we need to fix
    Rails.logger.info "\e[31mDEFAULT LEGACY ROUTE: #{request.method} #{request.path} | #{request.params.inspect}\e[0m"
    true
  }
end
