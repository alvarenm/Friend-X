class Group < ApplicationRecord
  has_many :users, through: :user_group
  has_many :user_group
  has_many :plays, dependent: :destroy

  validates :group_name, :presence => true
end
