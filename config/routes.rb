Rails.application.routes.draw do

    root 'app#home'

    devise_for :admin, 
        :controllers => { 
        registrations: 'admins/registrations'
    },
    path: "system", path_names: { 
        sign_in: 'login', 
        sign_out: 'logout', 
        confirmation: 'verify', 
        unlock: 'unblock', 
        registration: 'register', 
        sign_up: 'signup'
    } 

    devise_for :staffs, 
        :controllers => { 
        registrations: 'staffs/registrations'
    },
    path: "app", path_names: { 
        sign_in: 'login', 
        sign_out: 'logout', 
        confirmation: 'verify', 
        unlock: 'unblock', 
        registration: 'register', 
        sign_up: 'signup'
    } 

    get 'hospitals/new'
    get 'staffs/new'
    get 'patients/new'
    get 'staffs/show'

    post 'search' => 'app#search_ssn'

    resources :hospitals
    resources :staffs
    resources :patients

end
