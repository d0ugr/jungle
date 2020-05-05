require 'rails_helper'

RSpec.describe User, type: :model do

  subject do
    described_class.new(
      first_name:            "Test",
      last_name:             "User",
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
      subject.first_name = nil
      expect(subject).to be_invalid
      expect(subject.errors.full_messages).to include("First name can't be blank")
    end

    it "invalid with missing last name" do
      subject.last_name = nil
      expect(subject).to be_invalid
      expect(subject.errors.full_messages).to include("Last name can't be blank")
    end

    it "invalid with missing email" do
      subject.email = nil
      expect(subject).to be_invalid
      expect(subject.errors.full_messages).to include("Email can't be blank")
    end

    it "invalid with missing password" do
      subject.password = nil
      expect(subject).to be_invalid
      expect(subject.errors.full_messages).to include("Password can't be blank")
    end

    it "invalid with missing password confirmation" do
      subject.password_confirmation = nil
      expect(subject).to be_invalid
      expect(subject.errors.full_messages).to include("Password confirmation can't be blank")
    end

    it "invalid with mismatch passwords" do
      subject.password = "password"
      expect(subject).to be_invalid
      expect(subject.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "invalid with short password" do
      subject.password = "p"
      expect(subject).to be_invalid
      expect(subject.errors.full_messages.any? { |error| error.include?("Password is too short") }).to be(true)
    end

    it "invalid with existing email" do
      user = User.new(
        first_name:            "Test",
        last_name:             "User",
        email:                 "test@test.com",
        password:              "secret",
        password_confirmation: "secret"
      )
      user.save
      subject.save
      expect(subject).to be_invalid
      expect(subject.errors.full_messages).to include("Email has already been taken")
    end

    it "invalid with existing email case insensitive" do
      user = User.new(
        first_name:            "Test",
        last_name:             "User",
        email:                 "TEST@TEST.COM",
        password:              "secret",
        password_confirmation: "secret"
      )
      user.save
      expect(user).to be_valid
      subject.save
      expect(subject).to be_invalid
      expect(subject.errors.full_messages).to include("Email has already been taken")
    end

  end

end
