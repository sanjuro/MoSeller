class OrdersController < ApplicationController
 
  # Declare exception to handler methods
  rescue_from Exception, :with => :show_error 
  rescue_from ActiveRecord::RecordNotFound, :with => :render_404 
  
  helper :base  
  helper :products
  helper_method :sort_column, :sort_direction
  
  before_filter :authenticate_user!, :set_current_user
  
  def index
    # @orders = Order.by_user_id(current_user.id).order('order.created_at DESC').paginate(:page => params[:page])

    @orders = Order.by_user_id(current_user.id).search(params[:search],params[:fieldtype]).order(sort_column + " " + sort_direction).order('order.created_at DESC').paginate(:per_page => 15, :page => params[:page])
      
    @orders_all = Order.by_user_id(current_user.id).order('order.created_at DESC')
    @order_customer_value = @orders_all.map(&:customer_total).sum
    @order_full_value = @orders_all.map(&:full_total).sum
    @order_volume = @orders_all.size
   
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
    @order = Order.find_by_id!(params[:id])
      
    @comments = @order.comments.recent.limit(10).all
   
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @order }
      format.json  { render :json => @order }
    end
  end
  
  def update
    @order = current_order
    if @order.update_attributes(params[:order])
      @order.order_items = @order.order_items.select {|li| li.quantity > 0 }
      # fire_event('moseller.order.contents_changed')
      respond_to do |format|
        format.mobile { redirect_to cart_path }
        format.html { redirect_to cart_path }
        format.xml  { render :xml => @order }
        format.json  { render :json => @order }
      end
    else
      respond_with(@order)
    end
  end  
  
  # Shows the current incomplete order from the session
  def edit
    # Shows the current incomplete order from the session
    @order = current_order(true)
    
    if current_user.has_low_cap(@order.billing_total)
      
      flash[:error] = I18n.t(:order_low_cap)
      # gflash :error => I18n.t(:order_low_cap)
      
      respond_to do |format|
        format.mobile { redirect_to contactpage_path }
        format.html { redirect_to contactpage_path }
        format.xml  { render :xml => @order }
        format.json  { render :json => @order }
      end
      
    end
    
    # @order = current_order(true) 
  end
  
  # Adds a new item to the order (creating a new order if none already exists)
  #
  # Parameters can be passed using the following possible parameter configurations:
  #
  # * Single variant/quantity pairing
  # +:variants => {variant_id => quantity}+
  #
  # * Multiple products at once
  # +:products => {product_id => variant_id, product_id => variant_id}, :quantity => quantity +
  # +:products => {product_id => variant_id, product_id => variant_id}}, :quantity => {variant_id => quantity, variant_id => quantity}+
  def populate
    @order = current_order(true)
    puts params
    params[:products].each do |product_id, variant_id|
      quantity = params[:quantity].to_i if !params[:quantity].is_a?(Hash)
      quantity = params[:quantity][variant_id.to_i].to_i if params[:quantity].is_a?(Hash)
      @order.add_variant(Variant.find(variant_id), quantity) if quantity > 0
    end if params[:products]

    params[:variants].each do |variant_id, quantity|
      quantity = quantity.to_i
      @order.add_variant(Variant.find(variant_id), quantity) if quantity > 0
    end if params[:variants]

    # fire_event('moseller.cart.add')
    # fire_event('moseller.order.contents_changed')
    respond_to do |format|
      format.mobile { redirect_to cart_path }
      format.html { redirect_to cart_path }
      format.xml  { render :xml => @order }
      format.json  { render :json => @order }
    end
  end  
  
  def empty
    if @order = current_order
      @order.order_items.destroy_all
    end

    respond_to do |format|
      format.mobile { redirect_to cart_path }
      format.html { redirect_to cart_path }
      format.xml  { render :xml => @order }
      format.json  { render :json => @order }
    end    
  end  
  
  def destroy
    @order = Order.find(params[:id])
    @order.destroy
   
    respond_to do |format|
      format.mobile { redirect_to cart_path }
      format.html { redirect_to(orders_url) }
      format.xml  { head :ok }
    end
  end  
  
  def pdf 
    @order = Order.find(params[:id])
    @order.generate_pdf
    
    # Send file to user
    send_file @order.order_location
  end  
  
  def show_error(exception)
    flash[:error] = exception.message
    # gflash :error => exception.message
    redirect_to homepage_path
  end 
  
  private
  
  def sort_column
    Order.column_names.include?(params[:sort]) ? params[:sort] : "created_at"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
  end  
  
end