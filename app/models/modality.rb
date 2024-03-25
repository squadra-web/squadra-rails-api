class Modality < ApplicationRecord
  validates :name, uniqueness: true
end
