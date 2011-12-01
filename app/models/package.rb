class Package < ActiveRecord::Base
  belongs_to :supplier
  belongs_to :order_item, :foreign_key => "order_item_id", :class_name => "OrderItem"
  
  attr_accessible :order_item_id, :payload, :permalink, :clazz, :updated_at, :created_at 
  
  @provider = nil
  
  def provider_class
    self.clazz
  end
  
  def provider
    logger.info "CALLING PACKAGE PROVIDER"
    p = provider_class
    Kernel.const_get(p)
    eval(p)
    @provider = p.constantize.new
  end     
  
  def get_voucher
    logger.info "CALLING PACKAGE GET VOUCHER"
    provider.get_voucher(self.order_item.variant.product.name, self.payload)
  end  
  
end