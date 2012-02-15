module Customer
  def add_to_cart(order, variant_id, quantity)   
      quantity = quantity.to_i if !quantity.is_a?(Hash)
      quantity = quantity[variant_id.to_i].to_i if quantity.is_a?(Hash)
      if quantity > 0 && quantity < 6
        order.add_variant(Variant.find(variant_id), quantity)
      end 
  end
end