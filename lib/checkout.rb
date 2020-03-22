class Checkout
  CURRENCY_UNIT = '£'

  attr_reader :promotional_rules, :products

  def initialize(promotional_rules)
    @promotional_rules = promotional_rules
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

  private

  def formatted_total
    sprintf("#{CURRENCY_UNIT}%.2f", calculated_total)
  end

  def calculated_total
    products.sum(&:price)
  end
end
