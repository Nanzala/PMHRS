Rails.application.routes.draw do

  get 'patients/new'

  get 'staffs/show'

  get 'staffs/new'

    resources :staffs
    resources :patients
end
