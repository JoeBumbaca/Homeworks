require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef") }
  subject(:brownie) {Dessert.new("brownie", 15, :chef)}

  describe "#initialize" do
    it "sets a type" do 
      expect(brownie.type).to eq("brownie")
    end

    it "sets a quantity" do 
      expect(brownie.quantity).to eq(15)
    end

    it "starts ingredients as an empty array" do 
      expect(brownie.ingredients).to be_empty
    end 

    it "raises an argument error when given a non-integer quantity" do
      expect { brownie.quantity("a bunch").to raise_error(ArgumentError) }
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do 
      brownie.add_ingredient("chocolate")
      expect(brownie.ingredients).to include("chocolate")
    end

  end

  describe "#mix!" do
    it "shuffles the ingredient array" do 
      brownie.add_ingredient("chocolate")
      brownie.add_ingredient("butter")
      brownie.add_ingredient("eggs")
      expect(brownie.ingredients).to_not eq(brownie.mix!)
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity"

    it "raises an error if the amount is greater than the quantity"
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name"
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in"
  end
end
