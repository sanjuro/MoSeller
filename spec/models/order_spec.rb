require 'spec_helper'

describe Order do
  
  let(:order) { Factory(:order) }
  
  before(:each) do 
    @attr = { :order_number => 'R573532535', :client_id => 1, :user_id => 1 }
  end
  
  it "should create a new instance given valid attributes" do 
    Order.create!(@attr)
  end
  
  context "#create" do   
    it "should assign an order number" do
      order.number.should_not be_nil
    end   
  end
  
  context "#next!" do
    context "when current state is confirm" do
      before { order.state = "confirm" }
      it "should finalize order when transitioning to complete state" do
        order.should_receive(:finalize!)
        order.next!
      end
    end
  end
  
  context "#products" do
    it "should return ordered products" do
      variant1 = mock_model(Variant, :product => "product1")
      variant2 = mock_model(Variant, :product => "product2")
      order_items = [mock_model(OrderItem, :variant => variant1), mock_model(OrderItem, :variant => variant2)]
      order.stub(:order_items => order_items)
      order.products.should == ['product1', 'product2']
    end
  end  
  
  context "#generate_order_number" do
    it "should generate a random string" do
      order.generate_order_number.is_a?(String).should be_true
      (order.generate_order_number.to_s.length > 0).should be_true
    end
  end
  
  context "#finalize!" do
    
    let(:order) { Factory(:order) }
      
    it "should set completed_at" do
      user = Factory(:user)
      order.user = user
      order.should_receive :completed_at=
      order.finalize!
    end
    
    it "should send an order confirmation email" do
      user = Factory(:user)
      order.user = user
      mail_message = mock "Mail::Message"
      OrderMailer.should_receive(:order_email).with(order).and_return mail_message
      mail_message.should_receive :deliver
      order.finalize!
    end
    
    it "should log state event" do
      user = Factory(:user)
      order.user = user
      order.state_events.should_receive(:create)
      order.finalize!
    end
  end
  
  context "#update!" do
    it "should call update_totals" do
      order.should_receive(:update_totals).twice
      order.update!
    end
  end
  
  context "#update_totals" do
    it "should set item_total to the sum of line_item amounts" do
      order_items = [ mock_model(OrderItem, :amount => 100.00, :cost => 80.00, :full => 80.00), mock_model(OrderItem, :amount => 50.00, :cost => 40.00, :full => 40.00) ]
      order.stub(:order_items => order_items)
      order.update!
      order.item_total.should == 150.00
    end
  end
  
end