class CheckoutController < ApplicationController

  helper :base  
  
  before_filter :load_order, :authenticate_user!, :set_current_user

  respond_to :html

  # Updates the order and advances to the next state (when possible.)
  def update
    if @order.update_attributes(object_params)

      # fire_event('moseller.checkout.update')
      
      if @order.respond_to?(:coupon_code) && @order.coupon_code.present?
        # fire_event('moseller.checkout.coupon_code_added', :coupon_code => @order.coupon_code)
      end
      
      
      if @order.state == "delivery"
        @order.customer_name = params[:customer_name]
        @order.email = params[:email]
        @order.mobile_number = params[:mobile_number]
        @order.save
      end

      if @order.next
        state_callback(:after)
      else
        flash[:error] = I18n.t(:payment_processing_failed)
        respond_with(@order, :location => checkout_state_path(@order.state))
        return
      end
      
      if @order.state == "complete" || @order.completed?
        flash[:success] = I18n.t(:order_processed_successfully)
        gflash :success => I18n.t(:order_processed_successfully)
        flash[:commerce_tracking] = "Your order number is " + @order.number().to_s()
        respond_with(@order, :location => completion_route)
      else
        respond_with(@order, :location => checkout_state_path(@order.state))
      end
    else
      respond_with(@order) { |format| format.html { render :edit } }
    end
  end

  private

  # Provides a route to redirect after order completion
  def completion_route
    order_path(@order)
  end

  def object_params
    # For payment step, filter order parameters to produce the expected nested attributes for a single payment and its source, discarding attributes for payment methods other than the one selected
    # if @order.payment?
    #  if params[:payment_source].present? && source_params = params.delete(:payment_source)[params[:order][:payments_attributes].first[:payment_method_id].underscore]
    #    params[:order][:payments_attributes].first[:source_attributes] = source_params
    #  end
    #  if (params[:order][:payments_attributes])
    #    params[:order][:payments_attributes].first[:amount] = @order.total
    #  end
    # end
    params[:order]
  end

  def load_order
    @order = current_order
    redirect_to cart_path and return unless @order and @order.checkout_allowed?
    redirect_to cart_path and return if @order.completed?
    @order.state = params[:state] if params[:state]
    state_callback(:before)
  end

  def state_callback(before_or_after = :before)
    method_name = :"#{before_or_after}_#{@order.state}"
    send(method_name) if respond_to?(method_name, true)
  end

  def before_address
    # @order.bill_address ||= Address.default
    # @order.ship_address ||= Address.default
  end

  def before_delivery
    # return if params[:order].present?
    # @order.shipping_method ||= (@order.rate_hash.first && @order.rate_hash.first[:shipping_method])
  end

  def before_payment
    current_order.payments.destroy_all if request.put?
  end

  def after_complete
    session[:order_id] = nil
  end

  def rescue_from_moseller_gateway_error
    flash[:error] = t('moseller_gateway_error_flash_for_checkout')
    render :edit
  end

end
