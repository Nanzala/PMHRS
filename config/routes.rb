Rails.application.routes.draw do
 
  get 'hospitals/new'
  get 'staffs/new'
  get 'patients/new'
  get 'staffs/show'

  resources :hospitals
  resources :staffs
  resources :patients
end
