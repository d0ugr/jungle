require 'rails_helper'

RSpec.describe Product, type: :model do

  describe 'Validations' do

    it 'name is required' do
      @category = Category.new(name: "Stuff")
      @product = Product.new(
        name:     nil,
        price:    4.20,
        quantity: 1000000,
        category: @category
      )
      @product.save
      expect(@product).to be_invalid
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end

    it 'price is required' do
      @category = Category.new(name: "Stuff")
      @product = Product.new(
        name:     "HUMAN FEET SHOES",
        price:    nil,
        quantity: 1000000,
        category: @category
      )
      @product.save
      expect(@product).to be_invalid
      expect(@product.errors.full_messages).to include("Price can't be blank")
    end

    it 'quantity is required' do
      @category = Category.new(name: "Stuff")
      @product = Product.new(
        name:     "HUMAN FEET SHOES",
        price:    4.20,
        quantity: nil,
        category: @category
      )
      expect(@product).to be_invalid
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end

    it 'category is required' do
      @category = Category.new(name: "Stuff")
      @product = Product.new(
        name:     "HUMAN FEET SHOES",
        price:    4.20,
        quantity: 1000000,
        category: nil
      )
      @product.save
      expect(@product).to be_invalid
      expect(@product.errors.full_messages).to include("Category can't be blank")
    end

  end

end
