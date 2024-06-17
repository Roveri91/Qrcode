FactoryBot.define do
  factory :comment do
    content "My comment"
    association :profile
    association :article
  end
end
