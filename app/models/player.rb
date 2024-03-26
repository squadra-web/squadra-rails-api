class Player < ApplicationRecord
  validates :email, uniqueness: true
  validates :phone, uniqueness: true

  belongs_to :user, optional: true
  belongs_to :team
end
