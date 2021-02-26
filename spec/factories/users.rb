FactoryBot.define do
  factory :user do
    nickname {Faker::Name.name}
    email {Faker::Internet.free_email}
    password { '1a' + Faker::Internet.password(min_length: 4) }
    password_confirmation {password}
    last_name {'田中'}
    first_name {'太郎'}
    katakana_last_name {'タナカ'}
    katakana_first_name {'タロウ'}
    birthday {Faker::Date.in_date_period}
  end
end
   