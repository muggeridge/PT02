
class ProjectRolesController < ApplicationController
    def create
        project_id = params[:project_role][:project_id]
        if ProjectRole.create(project_id: project_id, 
                              user_id: params[:project_role][:user_id])
            redirect_to :controller => 'projects', :action => 'show', :id => project_id
        else
            redirect_to root_path
        end
    end
end