module MoSale
  class PaymentMethodsController < ApplicationController
  
    def index
      @payment_methods = PaymentMethod.all
     
      respond_to do |format|
        format.html # index.html.erb
        format.xml  { render :xml => @payment_methods }
        format.json  { render :json => @payment_method }
      end
    end
    
    def new
      @payment_method = PaymentMethod.new
     
      respond_to do |format|
        format.html # new.html.erb
        format.xml  { render :xml => @payment_method }
        format.json  { render :json => @payment_method }
      end
    end
    
    def show
      @payment_method = PaymentMethod.find(params[:id])
     
      respond_to do |format|
        format.html # show.html.erb
        format.xml  { render :xml => @payment_method }
        format.json  { render :json => @payment_method }
      end
    end
   
    def destroy
      @payment_method = PaymentMethod.find(params[:id])
      @payment_method.destroy
     
      respond_to do |format|
        format.html { redirect_to(payment_method_url) }
        format.xml  { head :ok }
      end
    end  
    
  end
end