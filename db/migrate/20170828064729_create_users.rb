class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :user_name
      t.string :email
      t.string :password_digest
      t.string :phone
      t.text :address
      t.string :auth_token

      t.timestamps
    end
  end
end
