Rails.application.routes.draw do

    root 'app#home'

    devise_for :admin,
        :controllers => {
        registrations: 'admins/registrations',
        sessions: 'admins/sessions',
        passwords: 'admins/passwords'
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


    namespace :staffs do
        resources :staffs
        resources :staff_signup
        get 'applications' => 'staff_signup#staff_applications'
    end

    resources :hospitals



    post 'search' => 'app#search_ssn'

    resources :patients do
        resources :records
    resources :medications
    end
end
