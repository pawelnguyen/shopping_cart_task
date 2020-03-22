require 'checkout'

describe Checkout do
  let(:checkout) { described_class.new(promotions) }
  let(:promotions) { [] }

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

    context 'with promotions' do
      let(:promotions) { [double(calculate_discount: 1), double(calculate_discount: 2)] }

      it { expect(checkout.total).to eq '£2.00' }
    end
  end
end
