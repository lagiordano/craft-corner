class ProjectsController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocesable_entity_response
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

    def index 
        if params[:category_id]
            category = Category.find(params[:category_id])
            projects = category.projects
        else
            projects = Project.all
        end
        render json: projects, status: :ok
    end

    def show 
        project = find_project
        render json: project, status: :ok
    end

    def create
        user = User.find(session[:user_id])
        project = Project.create!(project_params)
        UserProject.create!(user_id: user.id, project_id: project.id, completed_status: user_project_params[:completed_status])
        render json: project, status: :created
    end

    def update
        project = find_project
        project.update!(project_params)
        render json: project, status: :ok
    end

    private 

    def find_project
        Project.find(params[:id])
    end

    def project_params
        params.permit(:title, :description, :url, :image, :likes, :category_id)
    end

    def user_project_params
        params.permit(:completed_status)
    end

    def render_unprocesable_entity_response invalid
        render json: {errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
    end

    def render_not_found_response
        render json: {error: "Project not found" }
    end

end
