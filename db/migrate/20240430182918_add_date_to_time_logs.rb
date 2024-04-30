class AddDateToTimeLogs < ActiveRecord::Migration[7.1]
  def change
      add_column :time_logs, :date, :date
  end
end
