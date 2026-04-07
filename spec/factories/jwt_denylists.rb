FactoryBot.define do
  factory :jwt_denylist do
    jti { "MyString" }
    exp { "2026-04-06 23:24:56" }
  end
end
