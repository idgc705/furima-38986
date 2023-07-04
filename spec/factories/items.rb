FactoryBot.define do
  factory :item do
    association :user
    
    name { 'test' }
    price { '1234' }
    explanation { 'aaaaaaaaaaaaa' }
    condition_id { '1' }
    shipping_cost_id { '1' }
    shipping_time_id { '1' }
    prefecture_id { '1' }
    category_id { '1' }
    
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end