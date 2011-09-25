class OrderItemsController < ApplicationController
  
  def index
    @order_items = OrderItem.all
   
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @order_items }
      format.json  { render :json => @order_items }
    end
  end
  
  def new
    @order_item = OrderItem.new
   
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @order_item }
      format.json  { render :json => @order_item }
    end
  end
  
  def show
    @order_item = OrderItem.find(params[:id])
   
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @order_item }
      format.json  { render :json => @order_item }
    end
  end
 
  def destroy
    @order_item = OrderItem.find(params[:id])
    @sorder_item.destroy
   
    respond_to do |format|
      format.html { redirect_to(order_item_url) }
      format.xml  { head :ok }
    end
  end  
  
end