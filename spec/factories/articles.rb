FactoryBot.define do
  factory :article do
    sequence(:title) { |n| "Article #{n}" }
    content "A test article"
    association :profile

    trait :with_comments do
      after(:create) { |article| create_list(:comment, 5, article: article )}
    end

  end
end
