FactoryBot.define do
  factory :profile do
    name "Bill"
    surname "Gates"
    birthday "1955-10-28"
    sequence(:linkedln) { |n| "https://www.linkedin.com/in/williamhgates#{n}"}
  end
end
