class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.string :name
      t.text :detail
      t.integer :fee
      t.string :address
      t.string :img

      t.timestamps
    end
  end
end
