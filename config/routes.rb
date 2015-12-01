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

    get 'reset' => 'app#reset'

    get 'system' => 'dashboard#home'
    post 'search' => 'app#search_ssn'

    resources :hospitals

    get 'staffs/applications' => 'staffs#staff_applications'
    resources :staffs

    resources :patients do
        resources :records
    end
end
