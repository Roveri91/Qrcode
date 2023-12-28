require 'rails_helper'

RSpec.describe Profile, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  it "is valid with a first name, surname, bithday"
  it "is invalid without a first name"
  it "is invalid without a surname"
  it "is invalid without a birthday"
  it "is invalid without a linkedln"
  it "is invalid with a duplicate linkedln"
  it "returns a user's full name as a astring "
end
