Rails.application.routes.draw do
  devise_for :users

  namespace :admin do
    resources :employees
    resources :employee_notes
    resources :project_types
    resources :travel_infos
    resources :clients
    resources :gc_contacts
    resources :project_managers
    resources :site_managers

    root to: "clients#index"  
  end

  resources :projects 
  resources :rosters do
    resources :roster_lists 
   end

   root to: 'projects#index'

  get 'new_store', :to => 'projects#new_store'
  get 'els', :to => 'projects#els'
  get 'fet', :to => 'projects#fet'
  get 'per_diem_info', :to => 'roster_lists#per_diem_info'
  get 'project_shifts', :to => 'projects#project_shifts'
  resources  'copy_roster_list', :to => 'rosters#copy_roster_list'

end


