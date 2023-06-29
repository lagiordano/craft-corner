class ProjectsController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocesable_entity_response
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

    def index 
        projects = Project.all
        render json: projects, status: :ok
    end

    def show 
        project = find_project
        render json: project, status: :ok
    end

    def create
        project = Project.create!(project_params)
        render json: project, status: :created
    end

    private 

    def find_project
        Project.find(params[:id])
    end

    def project_params
        params.permit(:title, :description, :url, :image, :likes, :category_id)
    end

    def render_unprocesable_entity_response invalid
        render json: {errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
    end

    def render_not_found_response
        render json: {error: "Project not found" }
    end

end
