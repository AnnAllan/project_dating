class ChangeBillingAddressToNullTrue < ActiveRecord::Migration[5.0]
  def change
    change_column :users, :billing_address, :integer, null: true
  end
end
