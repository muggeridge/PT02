class AddWeekNumIdToTimeLogs < ActiveRecord::Migration[7.1]
  def change
    add_column :time_logs, :week_num_id, :integer
  end
end
