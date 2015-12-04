Rails.application.routes.draw do

    root 'app#home'

    devise_for :admin, 
        :controllers => { 
        registrations: 'admins/registrations',
        sessions: 'admins/sessions'
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


    scope :staffs do
        resources :staffs
    end

    resources :hospitals

    get 'staffs/applications' => 'staff_signup#staff_applications'

    resources :staff_signup # only: [:new, :create, :show, :edit, :update, :destroy] 

    post 'search' => 'app#search_ssn'

    resources :patients do
        resources :records
    end
end
