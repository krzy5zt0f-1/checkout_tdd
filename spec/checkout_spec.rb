require_relative '../lib/checkout.rb'

RSpec.describe Items do
  it { is_expected.to respond_to(:see_price)}

  it { is_expected.to respond_to(:product_choice)}

describe "#see_price()" do
  it "can display the price" do
    expect {subject.see_price("milk")}.to output("1.29\n").to_stdout
  end
  it "throws an error if item cannot be found in inventory" do
    expect{subject.see_price("mac")}.to raise_error(NoMethodError)
end
end

describe "#product_choice()" do
  it "can select the product that exists" do
    expect(subject.product_choice("milk")).to eq ({ :product => "milk", :price =>  1.29 })
  end
  it "returns nil when inccorect product selected" do
    expect(subject.product_choice("mac")).to eq nil
end
end
end

describe Checkout do
  it { is_expected.to respond_to(:scan_item)}
  describe "#scan_item()" do
    it "scans an item into your basket at the checkout" do
      expect( subject.scan_item("bread")).to eq [{ product: "bread", price: 0.89 }]
    end
  end
end
