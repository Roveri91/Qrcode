require 'rails_helper'

RSpec.describe Article, type: :model do
  it "does not allow duplicate article names per profile" do
    profile = Profile.create(
      name: "Bill",
      surname: "Gates",
      birthday: "1955-10-28",
      linkedln: "https://www.linkedin.com/in/williamhgates/"
    )

    profile.articles.create(
      title: "Testing on rails",
      content: "Just buy Evereday Rails book"
    )

    new_article = profile.articles.build(
      title: "Testing on rails",
      content: "lorem aksfnie fnewfoiwnvdsj bfewo"
    )

    new_article.valid?
    expect(new_article.errors[:title]).to include("has already been taken")
  end


end
