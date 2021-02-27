FactoryBot.define do
  factory :item do
    item_name   {"商品"}
    description {"良いですよ"}
    category_id {2}
    status_id   {2}
    burden_id   {2}
    area_id     {2}
    day_id      {2}
    price       {300}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('app/assets/images/item-sample.png'), filename: 'item-sample.png')
    end
  end
end
