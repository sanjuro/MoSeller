class ProductsController < ActionController::Base

  def index
    @product = Product.all
   
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @products }
      format.json  { render :json => @products }
    end
  end
  
  def new
    @product = Product.new
   
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @products }
      format.json  { render :json => @products }
    end
  end
  
  def show
    @product = Product.find(params[:id])
   
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @product }
      format.json  { render :json => @product }
    end
  end
 
  def destroy
    @product = Product.find(params[:id])
    @product.destroy
   
    respond_to do |format|
      format.html { redirect_to(products_url) }
      format.xml  { head :ok }
    end
  end  
  
end