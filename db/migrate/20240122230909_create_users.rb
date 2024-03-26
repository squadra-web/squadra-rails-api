class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :genre
      t.string :email
      t.string :password_digest
      t.string :phone
      t.string :role
      t.string :status
      t.date :birthdate

      t.timestamps
    end
  end
end
