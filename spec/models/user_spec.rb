require 'rails_helper'

RSpec.describe User, type: :model do
  it "is valid with first name, last name, email, and password" do
    user = FactoryGirl.build(:user)
    expect(user).to be_valid
  end

  it "is invalid without first name" do
    user = FactoryGirl.build(:user, first_name: nil)
    user.valid?

    expect(user.errors[:first_name]).to include("can't be blank")
  end

  it "is invalid without last name" do
    user = FactoryGirl.build(:user, last_name: nil)
    user.valid?

    expect(user.errors[:last_name]).to include("can't be blank")
  end

  it "is invalid without email address" do
    user = FactoryGirl.build(:user, email: nil)
    user.valid?

    expect(user.errors[:email]).to include("can't be blank")
  end

  it "is invalid with a duplicate email address" do
    FactoryGirl.create(
      :user,
      email: 'alicemulley@gmail.com'
    )
    user = FactoryGirl.build(
      :user,
      email: 'alicemulley@gmail.com'
    )
    user.valid?

    expect(user.errors[:email]).to include("has already been taken")
  end

  it "returns a user's full name as a string" do
    user = FactoryGirl.build(:user, first_name: 'John', last_name: 'Doe')
    expect(user.name).to eq "John Doe"
  end
end
