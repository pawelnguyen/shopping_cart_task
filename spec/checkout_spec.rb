require 'checkout'

describe Checkout do
  describe 'interface' do
    it { should respond_to :scan }
    it { should respond_to :total }
  end

  describe '#new' do
    subject { checkout.new(promotional_rules) }
    let(:promotional_rules) { [] }
  end
end
