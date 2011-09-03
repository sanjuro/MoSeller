class ProductsController < ActionController::Base
  helper :products
  
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
    @product = Product.find_by_permalink!(params[:id])
    return unless @product

    @variants = Variant.active.includes([:option_values, :images]).where(:product_id => @product.id)
    # @selected_variant = @variants.detect { |v| v.available? }

    referer = request.env['HTTP_REFERER']

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
  
  private

  def accurate_title
    @product ? @product.name : super
  end
end