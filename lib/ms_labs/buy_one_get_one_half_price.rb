module MsLabs
  class BuyOneGetOneHalfPrice

    attr_accessor :target_product

    def initialize(target_product)
      @target_product = target_product
    end

    def call(products)
      targets, others = products.partition { |p| p.code == target_product.code }
      if targets.any?
        discounted_targets_price = reduce_half_per_pair(targets)
      else
        discounted_targets_price = 0.0
      end
      discounted_targets_price + others.map(&:price).inject(:+).to_f
    end

    def reduce_half_per_pair(targets)
      price = target_product.price
      amount = targets.length
      quotient, remainder = targets.length.divmod(2)
      (price * quotient * 1.5) + (price * remainder)
    end
  end
end