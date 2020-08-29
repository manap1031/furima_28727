FactoryBot.define do
  factory :user do
    nickname { 'furima' }
    email { Faker::Internet.free_email }
    password = Faker::Internet.password(min_length: 6)
    password { password }
    password_confirmation { password }
    first_name { '山ダあ' }
    last_name { '山ダあ' }
    first_name_kana { 'カタカナ' }
    last_name_kana { 'カタカナ' }
    birth_day { Faker::Date.between_except(from: 20.year.ago, to: 1.year.from_now, excepted: Date.today) }
  end
end
