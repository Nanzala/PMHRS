Rails.application.routes.draw do

    root 'staffs#new'

    devise_for :admin, 
        :controllers => { 
        registrations: 'admins/registrations'
    },
    path: "system", path_names: { 
        sign_in: 'login', 
        sign_out: 'logout', 
        confirmation: 'verification', 
        unlock: 'unblock', 
        registration: 'register', 
        sign_up: 'signup'
    } 

    get 'hospitals/new'
    get 'staffs/new'
    get 'patients/new'
    get 'records/new'
    get 'staffs/show'
    get 'hospitals/show'
    get 'records/show'

    resources :hospitals
    resources :staffs
    resources :patients
    resources :records

end
