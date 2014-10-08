module MsLabs
  class Order

    attr_accessor :products, :delivery_rules, :offer

    def initialize(args={})
      @products       = args[:products]
      @delivery_rules = args[:delivery_rules]
      @offer          = args[:offer]
    end
  end
end