class UserProjectsController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocesable_entity_response

    def create
        user_project = UserProject.create!(user_project_params)
        render json: user_project.project, status: :created
    end

    private 

    def user_project_params 
        params.permit(:user_id, :project_id, :completed_status)
    end

    def render_unprocesable_entity_response invalid
        render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
    end


end
