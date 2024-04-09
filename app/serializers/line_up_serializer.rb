class LineUpSerializer < BaseSerializer
  attributes :id, :position, :team
  
  belongs_to :player, if: -> { instance_options[:params]&.include? "player" }
end