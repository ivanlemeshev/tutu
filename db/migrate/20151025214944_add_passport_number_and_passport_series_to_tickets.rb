class AddPassportNumberAndPassportSeriesToTickets < ActiveRecord::Migration
  def change
    add_column :tickets, :passport_series, :string
    add_column :tickets, :passport_number, :string
  end
end
