module MsLabs
  class Order

    attr_accessor :products, :delivery_rules, :offer

    def initialize(args={})
      @products       = args[:products]
      @delivery_rules = args[:delivery_rules]
      @offer          = args[:offer]
    end

    def total
      net_total     = offer.call(products).round(2)
      shipping_cost = delivery_rules.call(net_total).round(2)
      net_total + shipping_cost
    end

    def add(code)
      products.push product_dictionary[code].new
    end

    private 

    def product_dictionary
      {
        "J01" => Jeans,
        "B01" => Blouse,
        "S01" => Socks,
      }
    end
  end
end