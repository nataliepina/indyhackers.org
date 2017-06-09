Rails.application.routes.draw do
  devise_for :admins

  namespace "admin" do
    resources :jobs
  end

  resources :jobs do
    post "viewed", :on => :member
    get "manage", :on => :member
  end

  resources :job_post_requests, :only => [:new, :create]
  resource :sitemap, :only => :show
  get 'job_post_request' => 'job_post_requests#new'
  get "calendar", :to => "site#calendar"
  get "submit_event", to: "site#event"

  get "why_indy", :to => "site#why_indy"
  get "holiday-social" => redirect('/holiday-social-2016/')

  get 'code-of-conduct' => 'site#code_of_conduct'

  get '/newsletter/subscribe' => redirect('http://eepurl.com/sMpJj')
  get '/newsletter/archive' => 'newsletters#index'

  resources :redirects, :only => [:show], :constraints => { :id => /[a-z0-9_]+/i }, :path => "r"

  get 'coc' => 'site#coc'

  root :to => "site#index"
end
