require 'percentage_discount_promotion'

describe PercentageDiscountPromotion do
  describe '#calculate_discount' do
    subject { described_class.new.calculate_discount(double, subtotal) }

    context 'checkout subtotal less than threshold' do
      let(:subtotal) { 50 }
      it { expect(subject).to eq 0 }
    end

    context 'checkout subtotal above threshold' do
      let(:subtotal) { 70 }
      it { expect(subject).to eq 7 }
    end

    context 'checkout subtotal above threshold that needs floor rounding' do
      let(:subtotal) { BigDecimal('70.25') }
      it { expect(subject).to eq 7.02 }
    end
  end
end
