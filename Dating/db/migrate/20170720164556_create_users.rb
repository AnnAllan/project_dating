class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
     t.string   :first_name,     null: false
     t.string   :last_name,       null: false
     t.string   :user_name,       null: false
     t.string   :email,           null: false
     t.string   :phone,           null: false
     t.string   :credit_card,     null: false
     t.integer  :home_address
     t.integer  :billing_address
     t.integer  :gender_identity, null: false
     t.text     :bio
     t.timestamps
    end
    add_index :users, :email, unique: true
    add_index :users, :user_name, unique: true
  end
end
