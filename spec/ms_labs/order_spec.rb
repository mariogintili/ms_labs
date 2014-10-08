require "spec_helper"

describe MsLabs::Order do

  let(:jeans)               { double('jeans', code: "J01", price: 32.95) }
  let(:blouse)              { double('blouse', code: "B01", price: 24.95) }
  let(:socks)               { double('socks', code: "S01", price: 7.95)}
  let(:simple_offer) do
    ->(products) { products.map(&:price).inject(:+) / 2.0 }
  end
  let(:delivery_rules) do
    ->(total) {
      case 
      when 50.0 > total
        4.95
      when 90 > total > 50   
        2.95
      when total > 90
        0.0
      end
    }
  end

  describe "#initialize" do

    subject { Order.new(products: [jeans, blouse], delivery_rules: delivery_rules, offer: simple_offer) }

    it "takes in products, delivery rules and an offer, and sets them as attributes" do
      expect(subject.products).to eq [jeans, blouse]
      expect(subject.delivery_rules).to eq delivery_rules
      expect(subject.offer).to eq simple_offer
    end
  end
end