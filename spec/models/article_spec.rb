require 'rails_helper'

RSpec.describe Article, type: :model do
  before do
    @profile = Profile.create(
      name: "Bill",
      surname: "Gates",
      birthday: "1955-10-28",
      linkedln: "https://www.linkedin.com/in/williamhgates/"
    )
  end

  it "has valid factory" do
    expect(FactoryBot.build( :article)).to be_valid
  end

  it "can have many comments" do
    article = FactoryBot.create(:article, :with_comments)
    expect(article.comments.length).to eq 5
  end

  describe "validations" do
    it "is valid with a title and content" do
      test_article = @profile.articles.create(
        title: "This is a title",
        content: "This is a content of the article"
      )
      expect(test_article).to be_valid
    end
    it "is invalid without a title" do
      test_article = FactoryBot.build(:article, title: nil )
      test_article.valid?
      expect(test_article.errors[:title]).to include("can't be blank")
    end
    it "is invalid without a cocntent" do
      test_article = FactoryBot.build(:article, content: nil )
      test_article.valid?
      expect(test_article.errors[:content]).to include("can't be blank")
    end
  end

  describe "duplicate cases" do
    it "does not allow duplicate article names per profile" do

      @profile.articles.create(
        title: "Testing on rails",
        content: "Just buy Evereday Rails book"
      )

      new_article = @profile.articles.build(
        title: "Testing on rails",
        content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Id eu nisl nunc mi ipsum faucibus vitae aliquet. Mauris pharetra et ultrices neque ornare aenean euismod. Arcu bibendum at varius vel pharetra vel turpis nunc. "
      )

      new_article.valid?
      expect(new_article.errors[:title]).to include("has already been taken")
    end

    it "allows two profile to share a article name" do
      FactoryBot.create(:article, title: "Testing on rails")

      other_article = FactoryBot.build(:article, title: "Testing on rails")

      expect(other_article).to be_valid
    end
  end
end
