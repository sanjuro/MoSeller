# == Schema Information
#
# Table name: virtual_product_source
#
#  This model will outlines the strucutre of the Product Gateway class
#  basically is the parent class for all product gateways which will act 
#  as the pipelines to fetch products
#
#  id                   :integer         not null, primary key
#  source_name_id       :string(255)
#  source_id            :string(255)
#  product_gateway_id   :datetime
#
class VirtualProductSource < ProductSource
  delegate_belongs_to :provider, :new_product, :show_product

  attr_accessible :name, :description, :clazz
  
  belongs_to :supplier, :foreign_key => "productsource_supplier_id", :class_name => "Supplier"  
  
  validates :name,  :presence => true
  validates :supplier_id,  :presence => true

  preference :server, :string, :default => 'test'
  preference :test_mode, :boolean, :default => true

  def product_source_class
    Virtual
  end

  # instantiates the selected gateway and configures with the options stored in the database
  def self.current
    super
  end

  def provider
    gateway_options = options
    gateway_options.delete :login if gateway_options.has_key?(:login) and gateway_options[:login].nil?
    @provider ||= provider_class.new(gateway_options)
  end

  def options
    options_hash = {}
    self.preferences.each do |key,value|
      options_hash[key.to_sym] = value
    end
    options_hash
  end

  def method_missing(method, *args)
    if @provider.nil? || !@provider.respond_to?(method)
      super
    else
      provider.send(method)
    end
  end

  def method_type
    "gateway"
  end

end
