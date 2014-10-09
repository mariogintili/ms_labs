require "spec_helper"

describe "M&S Digital Labs integration scenarios" do

  let(:jean_code) { "J01" }
  let(:jeans)     { Product::Jeans.new }
  let(:blouse)    { Product::Blouse.new }
  let(:socks)     { Product::Socks.new }

  shared_examples "M&S scenario" do

    it "returns the expected total" do
      expect(subject.total).to eq total
    end
  end

  describe "sockets and a blouse" do

    let(:subject) { MsLabs::Order.new(products: [socks, blouse], delivery_rules: delivery_rules, offer: jeans_offer) }
    let(:total)   { 37.85 }

    it_behaves_like "M&S scenario"
  end

  describe "2 pairs of jeans, get one 1/2 off" do

    subject       { MsLabs::Order.new(products: [jeans, jeans], delivery_rules: delivery_rules, offer: jeans_offer) }
    let(:total)   { 54.37 }

    it_behaves_like "M&S scenario"
  end

  describe "jeans and blouse" do

    subject       { MsLabs::Order.new(products: [jeans, blouse], delivery_rules: delivery_rules, offer: jeans_offer) }
    let(:total)   { 60.85 }

    it_behaves_like "M&S scenario"
  end

  describe "3 pairs of jeans, 2 pairs of socks" do
    subject       { MsLabs::Order.new(products: [jeans, jeans, jeans, socks, socks], delivery_rules: delivery_rules, offer: jeans_offer) }
    let(:total)   { 98.27 }

    it_behaves_like "M&S scenario"
  end
end