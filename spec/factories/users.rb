FactoryBot.define do
  factory :user do
    name { "hoge" }
    email { "foo@bar.com" }
    password {"password"}
  end
end
