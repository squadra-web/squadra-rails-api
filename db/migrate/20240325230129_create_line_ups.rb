class CreateLineUps < ActiveRecord::Migration[6.1]
  def change
    create_table :line_ups do |t|
      t.string :position
      t.belongs_to :player, foreign_key: { to_table: :players }
      t.belongs_to :team, foreign_key: { to_table: :teams }

      t.timestamps
    end
  end
end
