require 'checkout'
require 'product'

describe 'Checkout integration test' do
  let(:checkout) { Checkout.new(promotional_rules) }

  describe 'basket with all products' do
    let(:products) { [Product.find('001'), Product.find('002'), Product.find('003')] }
    let(:promotional_rules) { double }

    it 'calculates expected total price' do
      products.each { |product| checkout.scan(product) }
      expect(checkout.total).to eq '£66.78'
    end
  end

  describe 'basket using a Red Scarf promotion' do
    let(:products) { [Product.find('001'), Product.find('003'), Product.find('001')] }
    let(:promotional_rules) { double }

    it 'calculates expected total price' do
      products.each { |product| checkout.scan(product) }
      expect(checkout.total).to eq '£36.95'
    end
  end
end
