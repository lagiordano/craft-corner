class UserProjectsController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocesable_entity_response
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

    
    #  clicking 'add project' on front end will create a user_proejct association, will also update the project to increase the 'adds' count by 1
    def create
        user_project = UserProject.create!(user_project_params)
        adds = user_project.project.adds
        adds += 1
        user_project.project.update!(adds: adds)
        render json: user_project.project, status: :created
    end

    #  clicking 'remove from list' on front end will delete user_project
    def destroy
        user_project = find_user_project
        user_project.destroy
        head :no_content
    end

    #  allows user to change project completed_status on front end
    def update
        user_project = find_user_project
        project = Project.find(user_project.project_id)
        user_project.update(user_project_params[:completed_status])
        render json: project, status: :ok
    end

    private 

    def find_user_project 
        UserProject.find(params[:id])
    end

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
