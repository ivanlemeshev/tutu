class AddIndexesToTickets < ActiveRecord::Migration
  def change
    add_index :tickets, :user_id
    add_index :tickets, :train_id
  end
end
