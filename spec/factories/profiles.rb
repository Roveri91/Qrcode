FactoryBot.define do
  factory :profile, aliases: [ :owner ] do
    name { "Paul" }
    surname { "McMahon" }
    birthday { "1983-03-12" }
    sequence(:linkedln) { |n| "https://www.linkedin.com/in/paulwimcmahon#{n}/"}

    trait :with_articles do
      after(:create) { |profile| create_list(:article, 2, profile: profile) }
    end
  end
end
