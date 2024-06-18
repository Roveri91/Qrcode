FactoryBot.define do
  factory :comment do
    content "My comment!"
    association :article
    profile { article.profile }
  end
end
