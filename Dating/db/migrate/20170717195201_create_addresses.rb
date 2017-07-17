class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.string :street_address, null:false
      t.string :secondary_address, null: false
      t.string :city
      t.string :state_abbr
      t.string :zip, null: false
      t.integer :user_id, null:false
      t.boolean :billing_address

      t.timestamps
    end
  end
end
