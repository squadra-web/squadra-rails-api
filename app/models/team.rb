class Team < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :group, optional: true
  has_many :players
end
