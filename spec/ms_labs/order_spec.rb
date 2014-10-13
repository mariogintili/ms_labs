require "spec_helper"

describe MsLabs::Order do

  subject                   { Order.new(products: [jeans, blouse], delivery_rules: delivery_policy, offer: simple_offer) }
  let(:jeans)               { double('jeans', code: "J01", price: 32.95) }
  let(:blouse)              { double('blouse', code: "B01", price: 24.95) }
  let(:socks)               { double('socks', code: "S01", price: 7.95)}
  let(:products)            { [jeans, blouse] }
  let(:delivery_policy)     { delivery_rules }
  let(:simple_offer) do
    ->(products) { products.map(&:price).inject(:+) / 2.0 }
  end
  describe "#initialize" do


    it "takes in products, delivery rules and an offer, and sets them as attributes" do
      expect(subject.products).to eq products
      expect(subject.delivery_rules).to eq delivery_policy
      expect(subject.offer).to eq simple_offer
    end
  end

  describe "#total" do

    let(:net_total) { 28.95 }

    it "calls for the offer given the products" do
      expect(simple_offer).to receive(:call).with(products).and_return net_total
      subject.total
    end

    it "calls for the delivery rules and returns the delivery price" do
      expect(delivery_policy).to receive(:call).with(net_total).and_return(4.95)
      subject.total
    end

    it "returns the total, with the discounts and the shipping cost added" do
      expect(subject.total).to eq(net_total + 4.95)
    end
  end

  describe "#add" do

    let(:jeans_code) { "J01" }

    it "takes in an add code and creates the product from it" do
      expect(Product).to receive(:new).with(jeans_code)
      subject.add jeans_code
    end
  end
end