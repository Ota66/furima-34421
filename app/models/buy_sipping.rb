class BuySipping
  include ActiveModel::Model
  attr_accessor :postal_code, :area_id, :municipality, :house_number, :building_name, :phone_number, :user_id, :item_id

  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
    validates :area_id
    validates :municipality
    validates :house_number
    validates :phone_number
    validates :user_id
    validates :item_id
  end

  def save
    buy = buy.create(item_id: item_id, user_id: user_id)
    Sipping.create(postal_code: postal_code, area_id: area_id, municipality: municipality, house_number: house_number, building_name: building_name, phone_number: phone_number)
  end
end
