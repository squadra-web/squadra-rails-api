class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :genre
      t.integer :age
      t.string :email
      t.string :password
      t.string :phone
      t.string :role
      t.string :status

      t.timestamps
    end
  end
end
