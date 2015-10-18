class AddSerialNumberToCars < ActiveRecord::Migration
  def change
    add_column :cars, :serial_number, :integer
  end
end
