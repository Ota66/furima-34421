FactoryBot.define do
  factory :buy_sipping do
    postal_code   {'123-4567'}
    area_id       {2}
    municipality  {'蒲郡市'}
    house_number  {'1-1'}
    building_name {'蒲郡ハイツ'}
    phone_number  {'99999999999'}
    token         {"sample_token"}
  end
end