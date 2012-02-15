class AddToCartContext
  attr_reader :user, :order, :variant

  def self.call(user_id, order, variant_id, quantity)
    AddToCartContext.new(user_id, order, variant_id, quantity).call
  end

  def initialize(user_id, order, variant_id, quantity)
    @user = User.find(user_id)
    @order = order
    @variant_id = variant_id
    @quantity = quantity
    @user.extend Customer
  end

  def call
    @user.add_to_cart(@order, @variant_id, @quantity)
  end
end