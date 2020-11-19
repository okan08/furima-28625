FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    # password              {Faker::Internet.password(min_length: 6)}
    password              { 'password08' }
    password_confirmation { password }
    lastname              { '山田' }
    firstname             { '太郎' }
    furigana_last         { 'ヤマダ' }
    furigana_first        { 'タロウ' }
    birthday              { '2020-01-01' }
  end
end
