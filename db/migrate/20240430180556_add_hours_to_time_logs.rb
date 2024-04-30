class AddHoursToTimeLogs < ActiveRecord::Migration[7.1]
  def change
    add_column :time_logs, :hours, :decimal
  end
end
