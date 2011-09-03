require 'mo_sale/active_record'
require 'mo_sale/current_order'

ActionController::Base.class_eval do
  include ActiveRecord
  include CurrentOrder
end
