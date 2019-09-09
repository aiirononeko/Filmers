FactoryBot.define do
  factory :comment do
    content { "MyString" }
    user { nil }
    photo { nil }
  end
end
