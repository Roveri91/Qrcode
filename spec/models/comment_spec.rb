require 'rails_helper'

RSpec.describe Comment, type: :model do
  it "returns comments that match the search term" do
    profile = Profile.create(
      name: "Bill",
      surname: "Gates",
      birthday: "1955-10-28",
      linkedln: "https://www.linkedin.com/in/williamhgates/"
    )

    article = profile.articles.create(
      title: "Testing on rails",
      content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
    )

    comment1 = article.comments.create(
      content: "this is the first comment",
      profile: profile
    )
    comment2 = article.comments.create(
      content: "this is the second comment",
      profile: profile
    )
    comment3 = article.comments.create(
      content: "this is not the first comment",
      profile: profile
    )

    expect(Comment.search("first")).to include(comment1, comment3)
    expect(Comment.search("first")).to_not include(comment2)
  end

  it "returns an empty collection when no results are found" do
    profile = Profile.create(
      name: "Bill",
      surname: "Gates",
      birthday: "1955-10-28",
      linkedln: "https://www.linkedin.com/in/williamhgates/"
    )

    article = profile.articles.create(
      title: "Testing on rails",
      content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
    )

    comment1 = article.comments.create(
      content: "This is the first comment",
      profile: profile
    )
    comment2 = article.comments.create(
      content: "this is the second comment",
      profile: profile
    )
    comment3 = article.comments.create(
      content: "this is not the first comment",
      profile: profile
    )

    expect(Comment.search("message")).to be_empty
  end

end
