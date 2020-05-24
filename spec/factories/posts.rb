FactoryBot.define do
  factory :post do
    content { "hoge" }
    title { "hogehoge" }
    user_id {1}
  end
end
