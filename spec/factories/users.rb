FactoryBot.define do
  factory :user do
    name { "テストユーザー" }
    email { "test@example.com" }
    crypted_password { "password" }
    salt { "salt" }
    introduction { "こんにちは、テストユーザーです。" }
  end
end
