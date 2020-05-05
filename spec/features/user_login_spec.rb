require "rails_helper"

RSpec.feature "ProductDetails", type: :feature, js: true do

  before :each do
    User.new(
      email:                 "test@test.com",
      password:              "secret",
      password_confirmation: "secret",
      first_name:            "Test",
      last_name:             "User"
    ).save
  end

  scenario "Users can log in" do

    visit root_path

  end

end
