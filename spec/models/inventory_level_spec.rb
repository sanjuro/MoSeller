require 'spec_helper'

describe InventoryLevel do
  
  let(:product_source) { mock_model(ProductSource, :id => 2, :name => 'Freepaid', :clazz => 'Freepaid') }
  let(:product) { mock_model(Product, :id => 1, :product_source_id => 2, :name => 'Vodacom') }
  let(:variant) { mock_model(Variant, :cost_price => 50.62, :customer_price => 52.62, :full_price => 55.00) }
  let(:order_item) { mock_model(OrderItem, :product => product, :quantity => 5, :billing_price => 50.00) }
  
  it "should require a clazz" do
    no_clazz_inventory_level = InventoryLevel.new(:clazz => "")
    no_clazz_inventory_level.should_not be_valid
  end
  
  it "should return the clazz" do
    inventory_level = InventoryLevel.new(:clazz => "FreepaidInventory")
    inventory_level.provider_class.should  == "FreepaidInventory"
  end
  
  it "should return the provider class" do
    inventory_level = InventoryLevel.new(:clazz => "FreepaidInventory")
    inventory_level.provider.is_a?(FreepaidInventory).should be_true
  end
  
  it "should return the current stock level" do
    inventory_level = InventoryLevel.new(:clazz => "FreepaidInventory", :stock_level => 1000, :product_source => product_source)
    inventory_level.current_stock_level!.to_i.should  == 1000
  end
  
end