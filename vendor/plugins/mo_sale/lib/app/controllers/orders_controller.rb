class OrdersController < ActionController::Base
  
  def index
    @orders = Order.all
   
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @orders }
      format.json  { render :json => @orders }
    end
  end
  
  def new
    @order = Order.new
   
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @order, :include => [:order_item] }
      format.json  { render :json => @order }
    end
  end
  
  def show
    @order = Order.find(params[:id])
   
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @order }
      format.json  { render :json => @order }
    end
  end
 
  def destroy
    @order = Order.find(params[:id])
    @order.destroy
   
    respond_to do |format|
      format.html { redirect_to(orders_url) }
      format.xml  { head :ok }
    end
  end  
  
end