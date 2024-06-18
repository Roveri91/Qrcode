require 'rails_helper'

RSpec.describe Profile, type: :model do

  it "has a valid factory" do
    expect(FactoryBot.build(:profile)).to be_valid
  end

  it "can have many articles" do
    profile = FactoryBot.create(:profile, :with_articles)
    expect(profile.articles.length).to eq 2
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
      profile = FactoryBot.build(:profile, name: nil)
      profile.valid?
      expect(profile.errors[:name]).to include("can't be blank")
    end
    it "is invalid without a surname" do
      profile = FactoryBot.build(:profile, surname: nil)
      profile.valid?
      expect(profile.errors[:surname]).to include("can't be blank")
    end
    it "is invalid without a birthday" do
      profile = FactoryBot.build(:profile, birthday: nil)
      profile.valid?
      expect(profile.errors[:birthday]).to include("can't be blank")
    end
    it "is invalid without a linkedln" do
      profile = FactoryBot.build(:profile, linkedln: nil)
      profile.valid?
      expect(profile.errors[:linkedln]).to include("can't be blank")
    end
    it "is invalid with a duplicate linkedln" do
      FactoryBot.create(:profile, linkedln: "https://www.linkedin.com/in/ElonMusck/")
      profile = FactoryBot.build(:profile, name: "Elon", surname: "Musck", linkedln: "https://www.linkedin.com/in/ElonMusck/")
      profile.valid?
      expect(profile.errors[:linkedln]).to include("This URL has already taken.")
    end

  end

  describe "full name method" do
    it "returns a profile's full name as a string" do
      profile = FactoryBot.build(:profile, name: "Elon", surname: "Musk")
      expect(profile.fullname).to eq  "Elon Musk"
    end
  end
end
