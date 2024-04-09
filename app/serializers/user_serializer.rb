class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :genre, :birthdate, :phone, :role, :status, :teams, :groups

  has_many :teams, if: -> { instance_options[:params]&.include? "teams" }
  has_many :groups, if: -> { instance_options[:params]&.include? "groups" }
end