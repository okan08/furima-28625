FactoryBot.define do
  factory :item do
    name             { '太郎' }
    introduction     { 'あああああ' }
    price            { 99_999 }
    category_id      { 3 }
    condition_id     { 3 }
    deliverypay_id   { 3 }
    prefecture_id    { 3 }
    day_id           { 3 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/image/test_image.png'), filename: 'test_image.png')
    end
  end
end
