class Play < ApplicationRecord
  belongs_to :group
  has_many :users, through: :group
end
