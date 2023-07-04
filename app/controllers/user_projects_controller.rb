class UserProjectsController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocesable_entity_response
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

    def create
        user_project = UserProject.create!(user_project_params)
        render json: user_project.project, status: :created
    end

    def index
        user = User.find(session[:user_id])
        render json: user.user_projects.paginate(page: params[:page], per_page: 10), status: :ok
    end

    private 

    def user_project_params 
        params.permit(:user_id, :project_id, :completed_status)
    end

    def render_unprocesable_entity_response invalid
        render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
    end

    def render_not_found_response
        render json: { error: "Not authorized, please log in" }, status: :not_found
    end

end
