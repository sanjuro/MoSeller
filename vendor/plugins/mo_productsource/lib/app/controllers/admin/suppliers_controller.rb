class SuppliersController < ActionController::Base
  before_filter :authenticate_admin!
  
  def index
    @suppliers = Supplier.all
   
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @suppliers }
      format.json  { render :json => @suppliers }
    end
  end
  
  def new
    @suppliers = Supplier.new
   
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @supplier }
      format.json  { render :json => @supplier }
    end
  end
  
  def show
    @supplier = Supplier.find(params[:id])
   
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @supplier }
      format.json  { render :json => @supplier }
    end
  end
 
  def destroy
    @supplier = Supplier.find(params[:id])
    @supplier.destroy
   
    respond_to do |format|
      format.html { redirect_to(suppliers_url) }
      format.xml  { head :ok }
    end
  end  
  
end