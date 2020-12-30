FactoryBot.define do
  factory :address_order do
    postnum          { '123-4567' }
    city             { 'あああああ' }
    housenum         { 'あああああ' }
    tel              { 12_345_678_910 }
    prefecture_id    { 3 }
    token            { 'tok_abcdefghijk00000000000000000' }
    association :user
  end
end
