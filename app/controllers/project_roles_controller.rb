
class ProjectRolesController < ApplicationController
    def create

        users = User.select { |user| user.last_name == params[:project_role][:user]}
        user_id = users[0].id  #could be multiple of last_name
        project_id = params[:project_role][:project_id]

        if ProjectRole.create(project_id: project_id, user_id: user_id)
            redirect_to :controller => 'projects', :action => 'show', :id => project_id

        else
            redirect_to root_path
        end
    end
end