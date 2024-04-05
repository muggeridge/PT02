
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
    def update
        binding.break
        @project = Project.find(params[:id])
        users = User.select { |user| user.last_name == params[:project][:user]}
        user = User.find(users[0].id) #could be multiple of last_name
        @project.users << user
        if @project.save
            redirect_to project_path
        else
            redirect_to root_path
        end
    end
end