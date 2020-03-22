require 'percentage_discount_promotion'

describe PercentageDiscountPromotion do
  describe '#calculate_discount' do
    subject { described_class.new.calculate_discount(checkout) }

    context 'checkout subtotal less than threshold' do
      let(:checkout) { double(subtotal: 50) }
      it { expect(subject).to eq 0 }
    end

    context 'checkout subtotal above threshold' do
      let(:checkout) { double(subtotal: 70) }
      it { expect(subject).to eq 7 }
    end
  end
end
