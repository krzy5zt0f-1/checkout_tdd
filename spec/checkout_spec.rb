require_relative '../lib/checkout.rb'

RSpec.describe Items do
  it { is_expected.to respond_to(:see_price)}

  it { is_expected.to respond_to(:product_choice)}

describe "#see_price()" do
  it "can display the price" do
    expect {subject.see_price("milk")}.to output("1.29\n").to_stdout
  end
  it "throws an error if item cannot be found in inventory" do
    expect{subject.see_price("mac")}.to raise_error(StandardError)
end
end

describe "#product_choice()" do
  it "can select the product that exists" do
    expect(subject.product_choice("milk")).to eq ({ :product => "milk", :price =>  1.29 })
  end
  it "throws an error when inccorect product selected" do
    expect{subject.product_choice("Jack Daniels")}.to raise_error(StandardError)
end
end
end

describe Checkout do
  it { is_expected.to respond_to(:scan_item)}
  it { is_expected.to respond_to(:total)}
  describe "#scan_item()" do
    it "scans an item into your basket at the checkout" do
      expect( subject.scan_item("bread")).to eq [{ product: "bread", price: 0.89 }]
    end
  end
  describe ".total" do
    it "displays a total price for items in basket using apropriate format" do
      subject.scan_item("milk")
      subject.scan_item("ham")
      expect{subject.total}.to output(["Items:", "milk: £1.29", "ham: £1.59","total: £2.88\n"].join("\n")).to_stdout
    end
    end
  end
