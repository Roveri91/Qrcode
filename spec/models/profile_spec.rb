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
    expect(profile.errors[:name]).to include("can't be blank")
  end
  it "is invalid without a surname" do
    profile = Profile.new(surname: nil)
    profile.valid?
    expect(profile.errors[:surname]).to include("can't be blank")
  end
  it "is invalid without a birthday" do
    profile = Profile.new(birthday: nil)
    profile.valid?
    expect(profile.errors[:birthday]).to include("can't be blank")
  end
  it "is invalid without a linkedln"
  it "is invalid with a duplicate linkedln"
  it "returns a user's full name as a astring "
end
