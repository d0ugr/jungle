require 'rails_helper'

RSpec.describe User, type: :model do

  subject do
    described_class.new(
      name:                  "Test User",
      email:                 "test@test.com",
      password:              "secret",
      password_confirmation: "secret"
    )
  end

  describe "Validations" do

    it "valid with valid values" do
      expect(subject).to be_valid
    end

    it "invalid with missing first name" do
    end

    it "invalid with missing last name" do
    end

    it "invalid with missing email" do
    end

    it "invalid with missing password" do
    end

    it "invalid with missing password confirmation" do
    end

    it "invalid with mismatch passwords" do
    end

    it "invalid with short password" do
    end

    it "invalid with existing case insensitive email" do
    end

  end

end
