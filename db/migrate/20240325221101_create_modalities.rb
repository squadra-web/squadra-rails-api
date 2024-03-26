class CreateModalities < ActiveRecord::Migration[6.1]
  def change
    create_table :modalities do |t|
      t.string :name
      t.integer :players
      t.string :status

      t.timestamps
    end
  end
end
