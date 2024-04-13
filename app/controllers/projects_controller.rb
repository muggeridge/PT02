
class ProjectsController < ApplicationController
    def index
        @projects = Project.all
    end
    def show 
        @project = Project.find(params[:id])
    end
    def destroy 
        if Project.find(params[:id]).destroy
            redirect_to projects_path
        else
            redirect_to root_path
        end
    end
    def create
        @project = Project.new(project_params)
        if( @project.save )
            redirect_to projects_path
        else
            redirect_to root_path
        end
    end

    def project_params
        params.require(:project).permit(
            :name 
        )
    end

end