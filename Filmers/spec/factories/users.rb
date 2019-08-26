FactoryBot.define do
  factory :user do
    name { "テストユーザー" }
    email { "test@example" }
    password { "password" }
  end
end
