require 'spec_helper'

describe Order do
  
  before(:each) do 
    @attr = { :order_number => 'R573532535', :client_id => 1, :user_id => 1 }
  end
  
  it "should create a new instance given valid attributes" do 
    Order.create!(@attr)
  end
  
end