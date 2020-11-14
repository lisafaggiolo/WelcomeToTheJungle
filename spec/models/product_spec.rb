require 'rails_helper'

RSpec.describe Product, type: :model do
  before(:each) do
    @product = Product.new(
      :name => "nice_glasses",
      :description => "to look better",
      :category_id => 1,
      :quantity => 10,
      :image => "this is an image",
      :price => 100)
  end
  
  describe "Validations" do
    it "is saved" do
      @product.presence == true 
    end

    it "has .name" do
      @product.name.presence == true   
    end

    it "has .price" do
      @product.price.presence == true   
    end

    it "has .quantity" do
      @product.quantity.presence == true   
    end

    it "has .category" do
      @product.category.presence == true   
    end

  end
end
