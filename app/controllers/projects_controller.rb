class ProjectsController < ApplicationController

    def index 
        projects = Project.all
        render json: projects, status: :ok
    end

    def create

    end


end
