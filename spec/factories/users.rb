FactoryBot.define do  
      factory :user do  
      nickname {"furima"}
      email {Faker::Internet.free_email}
      password = Faker::Internet.password(min_length:6)
      password {password}
      password_confirmation {password}
      first_name {"山田"}
      last_name {"太郎"}
      first_name_kana {"ヤマダ"}
      last_name_kana {"タロウ"}
      birth_day {"1984年10月31日"}
  end
end
