FactoryBot.define do
  factory :user do
    nickname { 'test' }
    email { 'test@test.com' }
    password { 'test123' }
    password_confirmation { password }
    last_name { 'テスト' }
    first_name { '太朗' }
    last_name_katakana { 'テスト' }
    first_name_katakana { 'タロウ' }
    birthday { '1992/09/19' }
  end
end
