class AddUniqueIndexToProjectRoles < ActiveRecord::Migration[7.1]
  def change
    add_index :project_roles, [:user_id, :project_id], unique: true 
  end
end
