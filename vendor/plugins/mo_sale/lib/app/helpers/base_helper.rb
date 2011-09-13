module BaseHelper

  # human readable list of variant options
  def variant_options(v, include_style = true)
    list = v.options_text
    # list = include_style ? content_tag(:span, " #{list}", :class => "variant") : " #{list}" 
    list
  end
  
  def format_price(price, options={})
    options.assert_valid_keys(:show_vat_text)
    # options.reverse_merge! :show_vat_text => MoSeller::Config[:show_price_inc_vat]
    formatted_price = number_to_currency(price, :unit => "R", :separator => ".", :delimiter => ",")
    if options[:show_vat_text]
      I18n.t(:price_with_vat_included, :price => formatted_price)
    else
      formatted_price
    end
  end

end
