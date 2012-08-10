class CreateBuildings < ActiveRecord::Migration
  def change
    create_table :buildings do |t|
      t.string :name
      t.integer :init_price
      t.integer :init_time
      t.integer :level
      t.integer :planet_id

      t.timestamps
    end
  end
end
