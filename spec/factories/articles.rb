FactoryBot.define do
  factory :article do
    sequece(:title) { |n| "Article #{n}" }
    content "A test article"
    association :profile
  end
end
