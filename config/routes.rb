Rails.application.routes.draw do
  get 'users/new'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root :to => 'welcome#index'
  post 'sms/send', to: 'welcome#sms'
  get 'welcome/index'

end
