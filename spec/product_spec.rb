require 'product'

describe Product do
  describe '.find' do
    subject { described_class.find('001') }

    it { expect(subject.code).to eq '001' }
    it { expect(subject.name).to eq 'Red Scarf' }
    it { expect(subject.price).to eq 9.25 }
  end
end
