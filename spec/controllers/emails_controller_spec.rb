require 'spec_helper' 

describe EmailsController do
  
  describe "POST 'create'" do 
    
    describe "success" do
      
      before(:each) do 
        @attr = { :email => { :raw => "test"}  }
      end

      it "should create a email" do 
        lambda do
          post :create, :email => @attr 
        end
      end
      
    end
    
  end 
  
end