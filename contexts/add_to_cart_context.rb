class AddToCartContext
  attr_reader :user, :order, :products, :quantity
  
  def self.call(user_id, order, products, quantity)
    AddToCartContext.new(user_id, order, products, quantity).call
  end

  def initialize(user_id, order, products, quantity)
    @user = User.find(user_id)
    @order = order
    @products = products
    @quantity = quantity
    @user.extend Customer
  end

  def call
    @user.add_to_cart(@order, @products, @quantity)
  end
end