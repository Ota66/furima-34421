class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :items
  has_many :buys

  with_options presence: true do
   validates :nickname
   validates :birthday

   with_options format: {with: /\A[ぁ-ん一-龥々]+\z/} do
     validates :last_name
     validates :first_name
   end

   with_options format: {with: /\A[ァ-ヶー－]+\z/} do
     validates :katakana_last_name
     validates :katakana_first_name
   end

  end

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX
end
