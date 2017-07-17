class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :user_name, null: false, unique: true
      t.string :email, null: false, unique: true
      t.string :phone, null:false
      t.string :credit_card, null: false
      t.integer :home_address
      t.integer :billing_address, null: false
      t.integer :gender_identity, null: false
      t.integer :bio

      t.timestamps
    end
    add_index :users, :email, unique: true
  end
end
