class SaleItemsController < ActionController::Base

  def index
    @sale_item = Product.all
   
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @sale_items }
      format.json  { render :json => @sale_item }
    end
  end
  
  def new
    @sale_item = SaleItem.new
   
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @sale_items }
      format.json  { render :json => @sale_items }
    end
  end
  
  def show
    @sale_item = SaleItem.find(params[:id])
   
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @sale_item }
      format.json  { render :json => @sale_item }
    end
  end
 
  def destroy
    @sale_item = SaleItem.find(params[:id])
    @sale_item.destroy
   
    respond_to do |format|
      format.html { redirect_to(sale_item_url) }
      format.xml  { head :ok }
    end
  end  
  
end