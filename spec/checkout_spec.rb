require 'checkout'

describe Checkout do
  let(:checkout) { described_class.new(promotional_rules) }
  let(:promotional_rules) { double }

  describe '#scan' do
    subject { checkout.scan(product); checkout }
    let(:product) { double }

    it { expect(subject.products).to eq [product] }
  end

  describe '#total' do
    subject { checkout.total }
    let(:product_1) { double(price: 2) }
    let(:product_2) { double(price: 3) }

    before do
      checkout.scan(product_1)
      checkout.scan(product_2)
    end

    it { expect(checkout.total).to eq '£5.00' }
  end
end
