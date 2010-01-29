ActionController::Routing::Routes.draw do |map|
  map.resources :web_links, :member => { :visit => :get }

  map.resources :involvement_histories

  map.resources :emails

  map.resource :facebook, :collection => {:tabs => :post, :install => :post, :remove => :post}, :controller => 'facebook'
  
  map.resources :correspondences, :only => [:index, :show, :destroy], :collection => { :processqueue => :get }, :member => { :rcpt => :get }

  map.resources :correspondence_types do |correspondence_types|
    correspondence_types.resources :email_templates
  end

  map.resources :school_years, :collection => {:reorder => :post}

  map.resources :group_types

  # map.resources :facebook, :collection => {:profile => :any}
  
  map.resources :ministry_role_permissions

  map.resources :timetables, :collection => {:search => :post}
  
  map.logout '/logout', :controller => 'sessions', :action => 'destroy'
  map.login '/login', :controller => 'sessions', :action => 'new'
  map.new_gcx '/new_gcx', :controller => 'sessions', :action => 'new_gcx'
  map.resource :session
  
  map.resources :developers

  map.resources :imports
  
  map.resources :profile_pictures

  map.resources :training_categories

  # map.resources :view_columns

  map.resources :columns

  map.resources :views, :member => {:set_default => :any} do |view|
    view.resources :view_columns
  end

  map.resources :custom_attributes
  map.resources :profile_questions
  map.resources :training_questions
  map.resources :involvement_questions

  map.resources :bible_studies

  map.resources :group_involvements, :collection => {:join_request => :post},
                                     :member => {:accept_request => :post,
                                                 :decline_request => :post,
                                                 :transfer => :post,
                                                 :change_level => :post,
                                                 :destroy_own => :delete}

  map.resources :groups, :member => {:find_times => :post,
                                     :compare_timetables => :any,
                                     :set_start_time => :any,
                                     :set_end_time => :any,
                                     :email => :post},
                         :collection => {:join => :get}

  map.resources :manage
  
  map.resources :reports
  
  map.resources :ministry_campuses, :collection => { :list => :any }

  map.resources :permissions

  map.resources :user_memberships, :collection => { :group => :any }

  map.resources :staff, :member => { :demote => :post }, :collection => {:search_to_add => :any}

  map.resources :dorms, :collection => {:list => :any}

  map.resources :ministry_roles, :member => {:permissions => :any}

  map.resources :campuses, :member => {:details => :any},
                           :collection => { :change_country => :any,
                                            :change_county => :any,
                                            :change_state => :any}

  map.resources :ministries, :collection => { :switch_list => :get},
                             :member => { :parent_form => :any,
                                          :set_parent => :any,
                                          :switch_apply => :post},
                             :has_many => [:ministry_campuses]

  map.resources :addresses

  map.resources :users
  
  map.resource  :session
  
  map.resource  :files

  map.resources :people,  :member => {:import_gcx_profile => :any,
                                      :set_initial_campus => :any},
                          :collection => {:directory => :any,
                                          :change_ministry_and_goto_directory => :any,
                                          :change_view => :any,
                                          :search => :any,
                                          :add_student => :any,
                                          :advanced => :get,
                                          :advanced_search => :post,
                                          :get_campus_states => :any,
                                          :get_campuses_for_state => :any,
                                          :set_current_address_states => :get,
                                          :set_permanent_address_states => :get,
                                          :perform_task => :post},
                         :has_many => [:timetables] do |person|
    person.resources :campus_involvements
    person.resources :ministry_involvements
    person.resources :involvement
    person.resources :training
    person.resources :profile_pictures
  end                             
                                          
  map.resources :customize
  
  map.resources :ministry_involvements


  # The priority is based upon order of creation: first created -> highest priority.
  
  # Sample of regular route:
  # map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  # map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # You can have the root of your site routed by hooking up '' 
  # -- just remember to delete public/index.html.
  map.cas_proxy_callback 'cas_proxy_callback/:action', :controller => 'cas_proxy_callback'
  
  map.connect '', :controller => "dashboard"

  # Install the default route as the lowest priority.
  map.connect ':controller/:action/:id.:format'
  map.connect ':controller/:action/:id'
end
