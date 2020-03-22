require 'multiple_product_promotion'
require 'product'

describe MultipleProductPromotion do
  describe '#calculate_discount' do
    subject { described_class.new.calculate_discount(checkout) }
    let(:checkout) { double(products: products) }

    context 'products for which promotion applies' do
      let(:products) { [Product.find('001'), Product.find('001')] }
      it { expect(subject).to eq 1.5 }
    end

    context 'products for which promotion does not apply' do
      let(:products) { [Product.find('001'), Product.find('002')] }
      it { expect(subject).to eq 0 }
    end
  end
end
