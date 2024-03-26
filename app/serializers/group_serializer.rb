class GroupSerializer < ActiveModel::Serializer
  attributes :id, :name, :status, :user_id

  has_many :players, if: -> { instance_options[:params]&.include? "players" }
  has_many :teams, if: -> { instance_options[:params]&.include? "teams" }
  belongs_to :user, if: -> { instance_options[:params]&.include? "user" }
end