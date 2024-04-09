class Player < ApplicationRecord
  validates :email, uniqueness: true, if: -> { email.present? }
  validates :phone, uniqueness: true, if: -> { phone.present? }

  belongs_to :user, optional: true
  belongs_to :group, optional: true
  has_many :line_ups
  has_many :teams, through: :line_ups

  accepts_nested_attributes_for :line_ups

  attr_accessor :position
end
