
class ProjectRolesController < ApplicationController
    def create
        if ProjectRole.create(project_role_params)
            redirect_to :controller => 'projects', :action => 'show', :id => project_role_params[:project_id]
        else
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