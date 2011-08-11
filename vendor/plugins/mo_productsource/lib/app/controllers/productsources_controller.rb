class ProductsourcesController < ActionController::Base
  include ProductsourceHelper
  respond_to :html, :xml, :json

  # Create new virtual product using relative product source
  def order
    # productsource = Productsource.find(params[:id])
      
    # Get product from product source
    @product = NewOrder(params[:post]);
   
    # Respond with new created virtual product
    respond_with(@product)
  end  
  
  def index
    @productsources = Productsource.all
   
    respond_with(@productsources)
  end
  
  def new
    @productsource = Productsource.new
    flash[:notice] = "Productsource was created successfully." if @productsource.save
    respond_with(@productsource)
  end
  
  def show
    @productsource = Productsource.find(params[:id])
   
    respond_with(@productsource)
  end
 
  def destroy
    @productsource = Productsource.find(params[:id])

    flash[:notice] = "Client was deleted successfully." if @productsource.destroy
    respond_with(@client) do |format|
      format.html { redirect_to(productsources_url) }
    end
  end  
  
end