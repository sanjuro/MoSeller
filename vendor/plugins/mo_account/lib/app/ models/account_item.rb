class AccountItem < ActiveRecord::Base
  attr_accessible :credit, :debit
  
  belongs_to :invoice
  
  has_many :state_events, :as => :stateful  
  
  # order state machine (see http://github.com/pluginaweek/state_machine/tree/master for details)
  state_machine :initial => 'created', :use_transactions => false do
  
    event :next do
      transition :from => 'created',  :to => 'unpaid'
      transition :from => 'unpaid',  :to => 'paid'
    end


    before_transition :to => 'paid' do |account|
      # order.process_payments! # process payments
      order.process_order_items! # fetch products
    end

    after_transition :to => 'paid' do |invoice|
      # do account and product stuff here   
      invoice.mark_as_paid! 
      
      # order.billing!
    end

  end    

end