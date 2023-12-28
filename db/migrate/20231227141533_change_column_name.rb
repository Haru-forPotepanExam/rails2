class ChangeColumnName < ActiveRecord::Migration[6.1]
  def change
    rename_column :reservations, :end, :end_at
    rename_column :reservations, :start, :start_at
  end
end
