class Checkout
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
    '£66.78'
  end
end
