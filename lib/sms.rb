class SMS
  
  require 'clickatell'
  include ActionView::Helpers

  @@SERVICE_USERNAME = AppConfig.instance.clickatell_user
  @@SERVICE_PASSOWRD = AppConfig.instance.clickatell_password
  @@SERVICE_API_ID = AppConfig.instance.clickatell_api_id  
  
  def create(recipient, order)
    
    message_text = String.new
    
    message_text << 'Thank you for shopping at MoSeller.'
    order.order_items.each do |order_item| 
      message_text << order_item.variant.product.name + '(' + number_to_currency(order_item.variant.full_price, :unit => "R", :separator => ".", :delimiter => ",") + '):'
      order_item.packages.each do |package|
        message_text << package.payload
      end
    end

    if Rails.env == 'production'
      api.send_message(recipient, message_text)
    end
    
  end
  
  private
    def api
      @api ||= Clickatell::API.authenticate(
        @@SERVICE_API_ID,
        @@SERVICE_USERNAME,
        @@SERVICE_PASSOWRD
      )
    end
    
end