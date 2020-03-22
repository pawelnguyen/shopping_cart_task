require 'ostruct'
require 'bigdecimal'

class Product < OpenStruct
  PRODUCT_ATTRIBUTES = [
    { code: '001', name: 'Red Scarf', price: BigDecimal('9.25') },
    { code: '002', name: 'Silver cufflinks', price: BigDecimal('45') },
    { code: '003', name: 'Silk Dress', price: BigDecimal('19.95') }
  ].freeze

  def self.find(code)
    new(PRODUCT_ATTRIBUTES.detect {|product| product[:code] == code })
  end
end
