class CreateCars < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.integer :kind
      t.integer :up_place_count
      t.integer :down_place_count

      t.timestamps null: false
    end

    add_belongs_to :cars, :train
  end
end
