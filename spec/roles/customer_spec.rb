describe Customer do
  let(:user) { User.new }
  let(:variant) { Variant.new }

  before do
    user.extend Customer
  end

  describe '#add_to_cart' do
    it 'puts the book in the cart' do
      user.add_to_cart(products)
      user.cart.should include(products)
    end
  end
end