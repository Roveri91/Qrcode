require 'rails_helper'

RSpec.describe Profile, type: :model do

  it "has a valid factory" do
    expect(FactoryBot.build(:profile)).to be_valid
  end

  describe "validations" do
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
    it "is invalid without a linkedln" do
      profile = Profile.new(linkedln: nil)
      profile.valid?
      expect(profile.errors[:linkedln]).to include("can't be blank")
    end
    it "is invalid with a duplicate linkedln" do
      Profile.create(
        name: "Bill",
        surname: "Gates",
        birthday: "2023-12-28",
        linkedln: "https://www.linkedin.com/in/williamhgates/"
      )
      profile = Profile.new(
        name: "Justin",
        surname: "Case",
        birthday: "1994-07-23",
        linkedln: "https://www.linkedin.com/in/williamhgates/"
      )
      profile.valid?
      expect(profile.errors[:linkedln]).to include("This URL has already taken.")
    end

  end
  describe "full name method" do
    it "returns a profile's full name as a string" do
      profile = Profile.new(
        name: "Bill",
        surname: "Gates",
        birthday: "2023-12-28",
        linkedln: "https://www.linkedin.com/in/williamhgates/"
      )
      expect(profile.fullname).to eq  "Bill Gates"
    end
  end
end
