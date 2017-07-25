class RemoveHomeAddressFromUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :home_address, :integer
  end
end
