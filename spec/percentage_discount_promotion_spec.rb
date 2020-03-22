require 'percentage_discount_promotion'

describe PercentageDiscountPromotion do
  describe '#calculate_discount' do
    subject { described_class.new.calculate_discount(double, subtotal) }

    context 'subtotal below threshold' do
      let(:subtotal) { 50 }
      it { expect(subject).to eq 0 }
    end

    context 'subtotal above threshold' do
      let(:subtotal) { 70 }
      it { expect(subject).to eq 7 }
    end

    context 'subtotal above threshold and needs floor rounding' do
      let(:subtotal) { BigDecimal('70.25') }
      it { expect(subject).to eq 7.02 }
    end
  end
end
