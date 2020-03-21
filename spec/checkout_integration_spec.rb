require 'checkout'

describe 'Checkout integration test' do
  describe 'basket with all products' do
    let(:products) { [Product.find('001'), Product.find('002'), Product.find('003')] }
    let(:checkout) { Checkout.new(promotional_rules) }
    let(:promotional_rules) { double }

    it 'calculates expected total price' do
      products.each { |product| checkout.scan(product) }
      expect(checkout.total).to eq '£66.78'
    end
  end
end
