Rails.application.routes.draw do

  get 'staffs/show'

  get 'staffs/new'

    resources :staffs

end
