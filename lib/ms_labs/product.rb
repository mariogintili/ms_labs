module MsLabs
  class Product
    class << self

      attr_accessor :datasource
    end

    def self.find(code)
      instance = new(code: code, price: nil)
      instance.price = datasource.fetch(code)[:price]
      instance
    end

    attr_reader :code
    attr_accessor :price 


    def initialize(code: nil, price: nil)
      @code  = code
      @price = price
    end
  end
end