FactoryBot.define do
  factory :message do
    body { "MyText" }
    ticket { nil }
    user { nil }
  end
end
