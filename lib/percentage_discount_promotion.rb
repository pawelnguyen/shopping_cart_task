require 'bigdecimal'

class PercentageDiscountPromotion
  attr_reader :threshold, :percentage

  def initialize(threshold: 60, percentage: 10)
    @threshold = threshold
    @percentage = percentage
  end

  def calculate_discount(_checkout, subtotal)
    return 0 if subtotal <= threshold
    (subtotal * (BigDecimal.new(percentage) / BigDecimal.new(100))).floor(2)
  end
end
