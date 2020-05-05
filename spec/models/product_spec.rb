require 'rails_helper'

RSpec.describe Product, type: :model do

  describe 'Validations' do

    it 'name is required' do
      expect(@product).to be_invalid
      expect(@product.errors.full_messages).to include(["Name can't be blank"])
    end

    it 'price is required' do
      expect(@product).to be_invalid
      expect(@product.errors.full_messages).to include("Price can't be blank")
    end

    it 'quantity is required' do
      expect(@product).to be_invalid
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end

    it 'category is required' do
      expect(@product).to be_invalid
      expect(@product.errors.full_messages).to include("Category can't be blank")
    end

  end

end
