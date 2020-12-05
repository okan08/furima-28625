FactoryBot.define do
  factory :item do
    name             { '太郎' }
    introduction     { 'あああああ' } 
    price            { '99999'}
    user_id          { 1 } 
    category_id      { 3 }
    condition_id     { 3 }
    deliverypay_id   { 3 }
    prefecture_id    { 3 }
    day_id           { 3 }
    user
  end
end
