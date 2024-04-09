class User < ApplicationRecord
  has_secure_password
  validates :email, uniqueness: true
  validates :password_digest,
            length: { minimum: 4 },
            if: -> { new_record? || !password_digest.nil? }

  has_many :teams
  has_many :groups
end
