class CategorysController < ApplicationController
  helper :base
  
  def index

    if user_signed_in?
      @user = User.find(current_user.id)
      @categorys = @user.categories
    else
      @categorys = Category.where('id = 1')
    end
   
    respond_to do |format|
      format.html { render :layout => true } # index.html.erb
      format.xml  { render :xml => @categorys }
      format.json  { render :json => @categorys }
    end
  end
  
  def new
    @category = Category.new
   
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @category }
      format.json  { render :json => @category }
    end
  end
  
  def show
    @category = Category.find(params[:id])
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @category }
      format.json  { render :json => @category }
    end
  end
 
  def destroy
    @category = Category.find(params[:id])
    @category.destroy
   
    respond_to do |format|
      format.html { redirect_to(categorys_url) }
      format.xml  { head :ok }
    end
  end  
  
end
