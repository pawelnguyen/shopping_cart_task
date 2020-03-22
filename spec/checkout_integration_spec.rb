require 'checkout'
require 'product'
require 'multiple_product_promotion'
require 'percentage_discount_promotion'

describe 'Checkout integration test' do
  let(:checkout) { Checkout.new(promotional_rules) }
  let(:promotional_rules) { [PercentageDiscountPromotion.new, MultipleProductPromotion.new] }

  describe 'basket with all products' do
    let(:products) { [Product.find('001'), Product.find('002'), Product.find('003')] }

    it 'calculates expected total price' do
      products.each { |product| checkout.scan(product) }
      expect(checkout.total).to eq '£66.78'
    end
  end

  describe 'basket using a Red Scarf promotion' do
    let(:products) { [Product.find('001'), Product.find('003'), Product.find('001')] }

    it 'calculates expected total price' do
      products.each { |product| checkout.scan(product) }
      expect(checkout.total).to eq '£36.95'
    end
  end
end
