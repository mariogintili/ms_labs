module MsLabs
  class Product

    attr_reader :code
    attr_accessor :price 

    REFERENCE = {
      "J01" => { price: 32.95 },
      "B01" => { price: 24.95 },
      "S01" => { price: 7.95 },
    }

    def initialize(code)
      @code  = code
      @price = REFERENCE.fetch(code)[:price]
    end
  end
end