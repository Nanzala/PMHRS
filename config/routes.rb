Rails.application.routes.draw do

    devise_for :admins, :controllers => { registrations: 'admins/registrations' }

    # devise_for :admins, controllers: { sessions: "admin/sessions" }

    get 'hospitals/new'
    get 'staffs/new'
    get 'patients/new'
    get 'staffs/show'

    resources :hospitals
    resources :staffs
    resources :patients

end
