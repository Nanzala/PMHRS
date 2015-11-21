Rails.application.routes.draw do

  get 'hospitals/new'

	resources :hospitals
	
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  get 'staffs/show'

  get 'staffs/new'

    resources :staffs

end
