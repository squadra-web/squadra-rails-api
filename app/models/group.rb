class Group < ApplicationRecord
  belongs_to :user
  has_many :players
  has_many :teams
  accepts_nested_attributes_for :players, allow_destroy: true
end
