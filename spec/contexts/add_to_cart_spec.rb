describe AddToCartContext do
  let(:user) { User.new }
  let(:variant) { Variant.new }

  it 'adds the variant to the users cart' do
    context = AddToCartContext.new(user.id, order, variants, quantity)
    context.user.should_recieve(:add_to_variant).with(context.variant)
    context.call
  end
end