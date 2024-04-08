
class ProjectsController < ApplicationController
    def index
        @projects = Project.all
    end
    def show 
        @project = Project.find(params[:id])

        #make last name array accessible to form for user addition from UI
        @user_last_names = ["<Select User>"]
        User.all.each do |user|
            @user_last_names << user.last_name
        end
        @user_last_names.sort!
    end
end