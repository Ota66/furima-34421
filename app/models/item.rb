class Item < ApplicationRecord
  belongs_to :user
  has_one    :buy
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :burden
  belongs_to :area
  belongs_to :day

  with_options presence: true do
    validates :item_name
    validates :description
    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :status_id
      validates :burden_id
      validates :area_id
      validates :day_id
    end 
    validates :price, numericality: { only_integer: true, greater_than: 299, less_than: 9999999}
    validates :user_id
    validates :image
  end
end
