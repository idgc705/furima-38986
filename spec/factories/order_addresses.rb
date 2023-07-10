FactoryBot.define do
  factory :order_address do
    postcode { '123-4567' }
    prefecture_id { '1' }
    city { '市区町村' }
    block { '1-1' }
    building { 'ビル' }
    phone_number { '0123456789' }
  end
end