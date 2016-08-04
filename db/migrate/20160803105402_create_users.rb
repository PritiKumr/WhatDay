class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :email
      t.string :device_id
      t.string :platform
      t.string :token
      t.string :name
      t.string :image
      t.string :team
      t.string :designation
      t.string :company

      t.timestamps
    end
  end
end
