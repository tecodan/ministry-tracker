class WebLinksController < ApplicationController
  before_filter :find_web_link, :only => [:edit, :update, :destroy, :permissions]
  # GET /web_links
  # GET /web_links.xml
  def index
  	# Force the user to be looking at the root ministry
    @ministry = current_ministry.root if current_ministry.root
    
    @web_links = WebLink.all(:conditions => {:ministry_id => @ministry.id})
    unless is_admin?
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
    @web_link = WebLink.new

  end

  # GET /web_links/1/edit
  def edit
  	
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
    @web_link = WebLink.find(params[:id])
    @web_link.destroy
    render :nothing => true
  end
  
  protected
  def find_web_link
    @web_link = WebLink.find(params[:id])
  end
end
