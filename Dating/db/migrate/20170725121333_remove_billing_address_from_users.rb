class RemoveBillingAddressFromUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :billing_address, :integer
  end
end
