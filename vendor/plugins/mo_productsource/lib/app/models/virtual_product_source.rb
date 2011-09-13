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
  
  belongs_to :supplier, :foreign_key => "productsource_supplier_id", :class_name => "Supplier"  
  
  validates :name,  :presence => true
  validates :supplier_id,  :presence => true

  # preference :server, :string, :default => 'test'
  # preference :test_mode, :boolean, :default => true
  
  def product_source_class
    VirtualProduct
  end

  # instantiates the selected gateway and configures with the options stored in the database
  def self.current
    super
  end

  def method_missing(method, *args)
    if @provider.nil? || !@provider.respond_to?(method)
      super
    else
      provider.send(method)
    end
  end

  def method_type
    "virtual"
  end
  
  def new_product(variant, order)
    logger.error "CALLING NEWPRODUCT FROM VIRTUAL PRODUCT SOURCE"
    raise "You must implement product_source_class method for this gateway."
  end  
  
  def show_product
  end  
  
end
