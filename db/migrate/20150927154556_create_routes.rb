class CreateRoutes < ActiveRecord::Migration
  def change
    create_table :routes do |t|
      t.string :title

      t.timestamps null: false
    end
  end
end
