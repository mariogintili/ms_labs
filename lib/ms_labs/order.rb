module MsLabs
  class Order

    attr_accessor :products, :delivery_rules, :offer

    def initialize(args={})
      @products       = args[:products]
      @delivery_rules = args[:delivery_rules]
      @offer          = args[:offer]
    end

    def total
      net_total     = reduce_decimals offer.call(products)
      shipping_cost = reduce_decimals delivery_rules.call(net_total)
      (net_total + shipping_cost).round(2)
    end

    def add(code)
      products.push product_dictionary[code].new
    end

    private

    def reduce_decimals(float)
      (Integer(float*100)*0.01).round(2)
    end

    def product_dictionary
      {
        "J01" => Jeans,
        "B01" => Blouse,
        "S01" => Socks,
      }
    end
  end
end