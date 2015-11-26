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
        registrations: 'staffs/registrations',
        sessions: 'staffs/sessions'
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
    get 'records/new'
    get 'staffs/show'
    get 'hospitals/show'
    get 'records/show'

    get 'reset' => 'app#reset'

    post 'search' => 'app#search_ssn'

    resources :hospitals
    resources :staffs
    resources :patients
    resources :records

end
