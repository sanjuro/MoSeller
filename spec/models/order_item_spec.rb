require 'spec_helper'

describe OrderItem do
  
  let(:product) { mock_model(Product, :id => 1, :product_source => product_source, :name => 'Vodacom') }
  let(:variant) { mock_model(Variant, :cost_price => 50.62, :customer_price => 52.62, :full_price => 55.00) }
  let(:order_item) { order_item = OrderItem.create(:product => Product, :quantity => 5) }
  let(:order) { mock_model(Order, :order_items => [order_item], :completed? => true, :update! => true) }
    
  before { order_item.stub(:order => order, :variant => variant, :new_record? => false) }  
    
  it "should require a variant" do
    no_variant_order_item = OrderItem.new(:quantity => 5, :variant => "")
    no_variant_order_item.should_not be_valid
  end
  
  it "should require a quantity" do
    no_quantity_order_item = OrderItem.new(:quantity => '', :variant => "")
    no_quantity_order_item.should_not be_valid
  end
  
  context "#increment_quantity" do
    it "should increase quantity" do
      order_item.increment_quantity
      order_item.save
      order_item.quantity.should == 6
    end
  end
  
  context "#decrease_quantity" do
    it "should decrease quantity" do
      order_item.decrement_quantity
      order_item.save
      order_item.quantity.should == 4
    end
  end
    
  context "#save" do
    it "should update totals" do
      order.should_receive(:update!)
      order_item.save
    end
    
    context "when order#completed? is true" do
      
      context "and order_item is a new record" do
        before { order_item.stub(:new_record? => true) }

        it "should decrease inventory" do
          OrderItem.stub(:decrease_stock_level)
          order_item.save
        end
      end
      
    end
    
    context "when order#completed? is false" do
      before { order.stub(:completed? => false) }

      it "should not manage inventory" do
        OrderItem.should_not_receive(:decrease_stock_level)
        order_item.save
      end
    end
    
  end
  
end