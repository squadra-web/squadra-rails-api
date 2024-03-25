class AddBirthdateColumnToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :birthdate, :date
  end
end
