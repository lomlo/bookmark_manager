require 'bcrypt'
require_relative '../models/user'

describe User do
  describe "#validate" do
    it "validates login details" do
      sign_up
      email = "alice@example.com"
      expect(User.validate(email,12345678)).to eq true
    end
  end

  describe "#validate" do
    it "refuses invalid login" do
      sign_up
      email = "alice@example.com"
      expect(User.validate(email,"cheese")).to eq false
    end
  end
end
