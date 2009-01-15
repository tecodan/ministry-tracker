class FacebookController < ApplicationController
  skip_before_filter CASClient::Frameworks::Rails::GatewayFilter, :login_required, :authorization_filter, :get_person, :get_ministry
  before_filter :require_facebook_login
  before_filter :authenticate_facebook_user, :except => [:no_access]
  layout 'facebook'
  
  def index
    # @person = @user.person
    setup_involvement_vars
  end
  
  
  def profile
    
  end
  
  def no_access
    
  end

  def finish_facebook_login
    # redirect to whatever your want your after-login landing page to be
    @user = User.find_or_create_from_facebook(fbsession)
    session[:user_id] = @user.id if @user
  end
  
  def authenticate_facebook_user
    self.current_user = session[:user_id] ? User.find(session[:user_id]) : User.find_or_create_from_facebook(fbsession)
    unless current_user
      redirect_to :action => 'no_access'
    else
      get_person
      get_ministry
    end
  end

end
