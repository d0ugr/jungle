require "rails_helper"

RSpec.feature "ProductDetails", type: :feature, js: true do

  before :each do
    @user = User.create!(
      email:                 "test@test.com",
      password:              "secret",
      password_confirmation: "secret",
      first_name:            "Test",
      last_name:             "User"
    )
  end

  scenario "Users can navigate to the login page and log in" do

    visit login_path
    within "nav" do
      expect(page).to_not have_content("Signed in as")
    end
    fill_in "email",    with: @user.email
    fill_in "password", with: @user.password
    click_button "Log in"
    within "nav" do
      expect(page).to have_content("Signed in as #{@user.first_name}")
    end

  end

end
