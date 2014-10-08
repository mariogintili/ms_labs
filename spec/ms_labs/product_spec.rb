require "spec_helper"

describe MsLabs::Product do

  shared_examples "a registered product" do

    context "#code" do

      it "returns its code" do
        expect(product.code).to eq code
      end
    end

    context "#price" do

      it "returns its price" do
        expect(product.price).to eq price
      end
    end
  end

  describe "::Jeans" do

    let(:product) { Product::Jeans.new }
    let(:price)   { 32.95 }
    let(:code)    { "J01" }

    it_behaves_like "a registered product"
  end

  describe "::Blouse" do

    let(:product) { Product::Blouse.new }
    let(:price)   { 24.95 }
    let(:code)    { "B01" }

    it_behaves_like "a registered product" 
  end

  describe "::Socks" do

    let(:product) { Product::Socks.new }
    let(:price)   { 7.95 }
    let(:code)    { "S01"}

    it_behaves_like "a registered product" 
  end
end