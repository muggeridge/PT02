class RenameProjectUsers < ActiveRecord::Migration[7.1]
  def change
    rename_table :project_users, :project_roles
  end
end
