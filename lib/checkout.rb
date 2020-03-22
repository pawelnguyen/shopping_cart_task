class Checkout
  CURRENCY_UNIT = '£'

  attr_reader :promotions, :products

  def initialize(promotions)
    @promotions = promotions
    @products = []
  end

  def scan(product)
    # Real-life checkouts use LineItems to group products and present their quantities and prices,
    # but since this supposed to be simple, I'll use a list of products
    @products << product
  end

  def total
    formatted_total
  end

  def subtotal
    products.sum(&:price)
  end

  private

  def formatted_total
    # Could use money gem instead, but feels like an overkill so far
    sprintf("#{CURRENCY_UNIT}%.2f", calculated_total)
  end

  def calculated_total
    running_subtotal = subtotal

    promotions.each do |promotion|
      discount = promotion.calculate_discount(self, running_subtotal)
      running_subtotal -= discount
    end

    running_subtotal
  end
end
