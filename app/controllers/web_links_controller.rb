class WebLinksController < ApplicationController
  before_filter :find_web_link, :only => [:edit, :update, :destroy, :permissions, :visit]
  before_filter :authorization_filter, :except => [:index, :visit]
  
  # GET /web_links
  # GET /web_links.xml
  def index
    # Display web links related to the current ministry, and all parent ministries
    search_ministries = Array.new
    search_ministries << current_ministry.id
    ministry = current_ministry
    until ministry.root?
	ministry = ministry.root
        search_ministries << ministry.id    
    end
    @web_links = WebLink.all(:conditions => {:ministry_id => search_ministries})
    unless is_admin?
        puts get_my_role
    	@web_links = @web_links.find_all {|web_link| web_link.permissions.any? {|role| role == get_my_role.id} unless web_link.permissions.nil?}
	end

    respond_to do |format|
      format.html { render :layout => 'application' }
      format.xml  { render :xml => @web_links }
    end
  end


  # GET /web_links/new
  # GET /web_links/new.xml
  def new
    # bypass application controller to show 'other' roles
    @possible_roles = get_ministry.ministry_roles.find(:all)
    @web_link = WebLink.new
    @web_link.url = "http://"

  end

  # GET /web_links/1/edit
  def edit
    # bypass application controller to show 'other' roles
    @possible_roles = get_ministry.ministry_roles.find(:all)	
  	respond_to do |wants|
      wants.js
    end
    
  end

  # POST /web_links
  # POST /web_links.xml
  def create
    @web_link = WebLink.new(params[:web_link])
    @web_link.ministry = get_ministry.root
    if @web_link.save
      render
    else
      render :action => :new
    end
    
  end

  # PUT /web_links/1
  # PUT /web_links/1.xml
  def update
	if @web_link.update_attributes(params[:web_link])
      render
    else
      render :action => :edit
    end
  end

  # DELETE /web_links/1
  # DELETE /web_links/1.xml
  def destroy
    @web_link.destroy
    render :nothing => true
  end
  
  def visit
    me = get_person
    WebLinkClick.record_visit(params[:id], me.id)
    redirect_to(@web_link.url)
  end
  
  protected
  def find_web_link
    @web_link = WebLink.find(params[:id])
  end
  

end
