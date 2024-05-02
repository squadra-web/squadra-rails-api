class PlayerSerializer < ActiveModel::Serializer
  attributes :id, :name, :phone, :email, :status, :user_id, :group_id, :team_id

  belongs_to :user, if: -> { instance_options[:params]&.include? "user" }
  belongs_to :group, if: -> { instance_options[:params]&.include? "group" }
  belongs_to :team, if: -> { instance_options[:params]&.include? "team" }
  has_many :teams, if: -> { instance_options[:params]&.include? "teams" }
  has_many :line_ups, if: -> { instance_options[:params]&.include? "line_ups" }
end