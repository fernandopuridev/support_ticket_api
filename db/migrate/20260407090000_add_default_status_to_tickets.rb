class AddDefaultStatusToTickets < ActiveRecord::Migration[8.1]
  def change
    change_column_default :tickets, :status, from: nil, to: 0
    change_column_null :tickets, :status, false, 0
  end
end
