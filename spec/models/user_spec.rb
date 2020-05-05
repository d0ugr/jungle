require 'rails_helper'

RSpec.describe User, type: :model do

  subject do
    described_class.new(
      name:     "Test User",
      email:    "test@test.com",
      password: "secret"
    )
  end

  describe "Validations" do



  end

end
