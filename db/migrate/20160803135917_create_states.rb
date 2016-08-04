class CreateStates < ActiveRecord::Migration[5.0]
  def change
    create_table :states do |t|
      t.integer :user_id
      t.string :date
      t.integer :state
      
      t.timestamps
    end
  end
end
