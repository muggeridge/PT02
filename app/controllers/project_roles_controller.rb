
class ProjectRolesController < ApplicationController
    def create
        project_role = ProjectRole.new(project_role_params)
        if project_role.save 
            redirect_to :controller => 'projects', :action => 'show', :id => project_role_params[:project_id]
        else
            flash[:notice] = "FAILURE - Could not add user \"" + User.find(project_role_params[:user_id]).last_name + "\" to project \"" + Project.find(project_role_params[:project_id]).name + "\""
            redirect_to root_path
        end
    end

    private

    def project_role_params
        params.require(:project_role).permit(
            :user_id, 
            :project_id, 
        )
    end
end