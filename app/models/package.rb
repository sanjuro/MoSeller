class Package < ActiveRecord::Base
  belongs_to :supplier
  belongs_to :order_item, :foreign_key => "order_item_id", :class_name => "OrderItem"
  
  attr_accessible :order_item_id, :payload, :permalink, :is_used, :clazz, :updated_at, :created_at 
  
  validates :order_item, :presence => true
  validates :clazz, :presence => true
  
  STATUS_USED = 'used'
  STATUS_NOT_USED = 'not_used'  
  
  @provider = nil
  
  def provider_class
    self.clazz
  end
  
  def provider
    p = provider_class
    Kernel.const_get(p)
    eval(p)
    @provider = p.constantize.new
  end     
  
  def get_voucher
    provider.get_voucher(self.order_item.variant.product.name, self.payload)
  end  
  
  def state
    case self.is_used
      when 1 then 'used'
      when 0 then 'not used'
    end
  end   
  
end