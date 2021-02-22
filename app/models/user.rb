class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :groups, through: :user_group
  has_many :user_groups
 
  validates :email, :presence => true
  validates :password, :presence => true
end
