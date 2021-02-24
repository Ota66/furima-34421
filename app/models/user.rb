class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :items
  has_many :buys

  with_options presence: true do
   validates :nickname
   validates :last_name, format: {with: /\A[一-龥ぁ-ん]/}
   validates :first_name, format: {with: /\A[一-龥ぁ-ん]/}
   validates :katakana_last_name, format: {with: /\A[ァ-ヶー－]+\z/}
   validates :katakana_first_name, format: {with: /\A[ァ-ヶー－]+\z/}
   validates :birthday
  end

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX
end
