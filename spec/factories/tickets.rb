FactoryBot.define do
  factory :ticket do
    title { "MyString" }
    description { "MyText" }
    category { 1 }
    status { 1 }
    user { nil }
  end
end
