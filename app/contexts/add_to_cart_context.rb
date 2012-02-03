class AddToCartContext
  attr_reader :user, :order, :variant

  def self.call(user_id, order, variants)
    AddToCartContext.new(user_id, order, variants).call
  end

  def initialize(user_id, order, variants)
    @user = User.find(user_id)
    @order = order
    @variants = variants
    @user.extend Customer
  end

  def call
    @user.add_to_cart(@order, @variants)
  end
end