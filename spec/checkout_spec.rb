require 'checkout'
require 'product'

describe Checkout do
  let(:checkout) { described_class.new(promotional_rules) }
  let(:promotional_rules) { double }

  describe '#scan' do
    subject { checkout.scan(product); checkout }
    let(:product) { double }

    it { expect(subject.products).to eq [product] }
  end
end
