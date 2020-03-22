class MultipleProductPromotion
  attr_reader :product_code, :min_amount, :discount
  
  def initialize(product_code = '001', min_amount = 2, discount = BigDecimal('0.75'))
    @product_code = product_code
    @min_amount = min_amount
    @discount = discount
  end

  def calculate_discount(checkout, _subtotal)
    amount = discounted_products_amount(checkout.products)
    return 0 if amount < min_amount
    amount * discount
  end

  private

  def discounted_products_amount(products)
    products.count { |product| product.code == product_code}
  end
end
