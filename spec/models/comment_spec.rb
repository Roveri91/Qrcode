require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    @profile = Profile.create(
      name: "Bill",
      surname: "Gates",
      birthday: "1955-10-28",
      linkedln: "https://www.linkedin.com/in/williamhgates/"
    )

    @article = @profile.articles.create(
      title: "Testing on rails",
      content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
    )

    @comment1 = @article.comments.create(
      content: "this is the first comment",
      profile: @profile
    )
    @comment2 = @article.comments.create(
      content: "this is the second comment",
      profile: @profile
    )
    @comment3 = @article.comments.create(
      content: "this is not the first comment",
      profile: @profile
    )
  end

  describe "validations" do
    it "is valid with a content of 10 char" do
      comment = @article.comments.create(
        content: "HELLO SIMO",
        profile: @profile
      )
      expect(comment).to be_valid
    end

    it "is valid with a content of 100 char" do
      comment = @article.comments.create(
        content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere quam nec quam ullamcorper!!",
        profile: @profile
      )
      expect(comment).to be_valid
    end

    it "is invalid with a content shorter than 10 char (9)" do
      comment = @article.comments.create(
        content: "# Hello!!",
        profile: @profile
      )
      comment.valid?
      expect(comment.errors[:content]).to include("is too short (minimum is 10 characters)")
    end

    it "is invalid with a content longer than 100 char (101)" do
      comment = @article.comments.create(
        content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere quam nec quam ullamcorper!!!",
        profile: @profile
      )
      comment.valid?
      expect(comment.errors[:content]).to include("is too long (maximum is 100 characters)")
    end
  end
  describe "search message for a term" do
    context "when a match is found" do
      # matching examples ...
      it "returns comments that match the search term" do
        expect(Comment.search("first")).to include(@comment1, @comment3)
        expect(Comment.search("first")).to_not include(@comment2)
      end
    end

    context "when no match is found " do
      # non-matching examples ...
      it "returns an empty collection when no results are found" do
        expect(Comment.search("message")).to be_empty
      end
    end
  end
end
