Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/send_demo_email', to: 'send_mail#demo_email'
end
