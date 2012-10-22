class AccountItem < ActiveRecord::Base
  attr_accessible :user_id, :credit, :debit, :account_item_status_id, 
                  :description, :created_at, :updated_at
  
  belongs_to :user
  
  scope :by_user, lambda {|user| joins(:users).where("users.id =?", user)}
  scope :by_user_id, lambda {|user_id| where("account_items.user_id =?", user_id)} 

end