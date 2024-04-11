class CreateTimeLogs < ActiveRecord::Migration[7.1]
  def change
    create_table :time_logs do |t|
      t.integer :user_id
      t.integer :project_id
      t.text :progress_comment
      t.timestamps
    end
  end
end
