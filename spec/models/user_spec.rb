require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @user = User.new(
      :first_name => "User",
      :last_name => "Testing",
      :email => "test@test.ca",
      :password => "test",
      :password_confirmation => "test")
  end
  
  describe "Validations" do
    it "has .first_name" do
      @user.first_name.presence == true   
    end

    it "has .last_name" do
      @user.last_name.presence == true   
    end

    it "has .email" do
      @user.email.presence == true   
    end

    it "has .password" do
      @user.password.presence == true   
    end
  end
end