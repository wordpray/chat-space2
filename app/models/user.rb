class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :group_users
  has_many :groups, through: :group_users
  has_many :messages

  scope :search_users, -> (keyword) {where('name LIKE(?)',"%#{keyword}%")}
end
