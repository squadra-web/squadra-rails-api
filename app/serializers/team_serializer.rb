class TeamSerializer < ActiveModel::Serializer
  attributes :id, :name, :status, :user_id, :group_id

  belongs_to :user, if: -> { instance_options[:params]&.include? "user" }
  belongs_to :group, if: -> { instance_options[:params]&.include? "group" }
  has_many :players, if: -> { instance_options[:params]&.include? "players" }
end