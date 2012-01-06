require 'spec_helper'

describe Package do
  
  let(:package) { mock_model(Package, :order_item_id => 1, :clazz => 'AirtimePackage', :is_used => 1) } 
    
  it "should require a order item" do
    no_order_item_package = Package.new(:order_item_id => "")
    no_order_item_package.should_not be_valid
  end
  
  it "should require a clazz" do
    no_clazz_package = Package.new(:order_item_id => 1, :clazz => "")
    no_clazz_package.should_not be_valid
  end
  
  it "should return the provider class" do
    package = Package.new(:clazz => "AirtimePackage")
    package.provider.is_a?(AirtimePackage).should be_true
  end
  
  context "#state" do   
    it "should return the used" do
      package = Package.new(:is_used => 1)
      package.state.should == 'used'
    end
    
    it "should return the not used" do
      package = Package.new(:is_used => 0)
      package.state.should == 'not used'
    end
  end
  
end