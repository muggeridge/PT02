
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

end