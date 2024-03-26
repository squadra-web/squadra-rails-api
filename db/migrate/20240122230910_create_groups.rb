class CreateGroups < ActiveRecord::Migration[6.1]
  def change
    create_table :groups do |t|
      t.string :name
      t.string :status
      t.belongs_to :user, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
