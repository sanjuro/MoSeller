# == Schema Information
#
# Table name: product_source
#
#  This model will outline the structure of a Product Source, basically
#  what type of product it is.
#
#  id                   :integer         not null, primary key
#  source_name_id       :string(255)
#  source_id            :string(255)
#  product_gateway_id   :datetime
#
class ProductSource < ActiveRecord::Base
  has_many :products
  
  attr_accessible :name, :description, :clazz  
  
  default_scope where(:deleted_at => nil)

  @provider = nil

  def self.available(display_on='both')
    ProductSource.all.select { |p| p.active && (p.display_on == display_on.to_s || p.display_on.blank?) && (p.environment == Rails.env || p.environment.blank?) }
  end

  def self.active?
    self.count(:conditions => {:type => self.to_s, :environment => Rails.env, :active => true}) > 0
  end

  def self.current
    ProductSource.find(:first, :conditions => {:active => true, :environment => Rails.env})
  end  
  
  def provider_class
    self.clazz
  end
  
  def provider
    logger.error "CALLING PRODUCTSOURCE PROVIDER"
    # product_source_options = options
    # product_source_options.delete :login if product_source_options.has_key?(:login) and product_source_options[:login].nil?
    # @provider ||= Freepaid.new
    p = provider_class
    Kernel.const_get(p)
    eval(p)
    @provider = p.constantize.new
  end
  
  def options
    options_hash = {}
    self.preferences.each do |key,value|
      options_hash[key.to_sym] = value
    end
    options_hash
  end  

  def method_type
    type.demodulize.downcase
  end

  def destroy
    self.update_attribute(:deleted_at, Time.now.utc)
  end

  def self.find_with_destroyed *args
    self.with_exclusive_scope { find(*args) }
  end
  
  def new_product(variant, order_item)
    logger.info "CALLING NEWPRODUCT FROM PRODUCT SOURCE"
    package = provider.new_product(variant, order_item)
  end     
end