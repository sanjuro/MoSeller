class SalesController < ActionController::Base

  def index
    @sales = Sale.all
   
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @sales }
      format.json  { render :json => @sales }
    end
  end
  
  def new
    @sale = Sale.new
   
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @sale, :include => [:sale_item] }
      format.json  { render :json => @sale }
    end
  end
  
  def show
    @sale = Sale.find(params[:id])
   
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @sale }
      format.json  { render :json => @sale }
    end
  end
 
  def destroy
    @sale = Sale.find(params[:id])
    @sale.destroy
   
    respond_to do |format|
      format.html { redirect_to(sales_url) }
      format.xml  { head :ok }
    end
  end  
  
end