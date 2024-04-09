class Team < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :group, optional: true
  has_many :line_ups
  has_many :players
  accepts_nested_attributes_for :players, allow_destroy: true

  after_create :create_line_ups_for_players

  private

  def create_line_ups_for_players
    players.each do |player|
      line_ups.create(player: player, position: player.position)
    end
  end
end
