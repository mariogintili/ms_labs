require "spec_helper"

describe MsLabs::Product do

  describe "#initialize" do

    subject { Product.new(code: "hello", price: 100) }

    it "receives a set of options and sets them as attributes" do
      expect(subject.code).to eq "hello"
      expect(subject.price).to eq 100
    end
  end

  describe ".find" do

    context "with a found product" do

      subject { Product.find("J01") }

      it "returns the valid code and price" do
        expect(subject.price).to eq 32.95
        expect(subject.code).to eq "J01"
      end
    end

    context "without a found product" do

      subject { Product.find("lorem") }

      it "throws an error" do
        expect{subject}.to raise_error
      end
    end
  end
end