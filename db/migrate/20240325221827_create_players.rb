class CreatePlayers < ActiveRecord::Migration[6.1]
  def change
    create_table :players do |t|
      t.string :name
      t.string :phone
      t.string :email
      t.string :status
      t.belongs_to :user, foreign_key: { to_table: :users }
      t.belongs_to :team, foreign_key: { to_table: :teams }
      t.belongs_to :group, foreign_key: { to_table: :groups }

      t.timestamps
    end
  end
end
