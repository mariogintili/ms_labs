module MsLabs
  class Product

    def code
      raise NotImplementedError
    end

    def price
      raise NotImplementedError
    end
  end

  class Jeans < Product

    def code
      "J01"
    end

    def price
      32.95
    end
  end

  class Blouse < Product

    def code
      "B01"
    end

    def price
      24.95
    end
  end

  class Socks < Product

    def code
      "S01"
    end

    def price
      7.95
    end
  end
end