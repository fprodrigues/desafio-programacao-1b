Rails.application.routes.draw do
 resources :arquivos
 root "arquivos#index"
end
