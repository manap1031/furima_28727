class AddPasswordConfimationToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :Password_confimation, :string
  end
end
