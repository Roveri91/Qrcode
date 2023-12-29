require 'rails_helper'

RSpec.describe Profile, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  it "is valid with a first name, surname, bithday, linkedln" do
    profile = Profile.new(
      name: "Bill",
      surname: "Gates",
      birthday: "1955-10-28",
      linkedln: "https://www.linkedin.com/in/williamhgates/"
    )
    expect(profile).to be_valid
  end
  it "is invalid without a name" do
    profile = Profile.new(name: nil)
    profile.valid?
    expect(profile.errors[:name]).to include("cant`t be blank")
  end
  it "is invalid without a surname"
  it "is invalid without a birthday"
  it "is invalid without a linkedln"
  it "is invalid with a duplicate linkedln"
  it "returns a user's full name as a astring "
end
