class PlayerSerializer < BaseSerializer
  attributes :id, :name, :phone, :email, :status, :user_id, :group_id

  belongs_to :user, if: -> { instance_options[:params]&.include? "user" }
  belongs_to :group, if: -> { instance_options[:params]&.include? "group" }
  has_many :teams, if: -> { instance_options[:params]&.include? "teams" }
  has_many :line_ups, if: -> { instance_options[:params]&.include? "line_ups" }
end