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
    sprintf("#{CURRENCY_UNIT}%.2f", calculated_total)
  end

  def calculated_total
    subtotal - promotion_discounts
  end

  def promotion_discounts
    promotions.sum do |promotion|
      promotion.calculate_discount(self)
    end
  end
end
