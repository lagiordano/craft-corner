class UserProjectsController < ApplicationController
    
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    
    before_action :correct_user, only: [:destroy, :update]

    #  '/user_projects' renders all user_projects belonging to current user with nested project and category 
    # def index 
    #     user_projects = @current_user.user_projects
    #     render json: user_projects, status: :ok
    # end

    # ADD USER AUTH
    def filtered_collection
        if params[:filter] == "shared by user"
            projects = Project.where("shared_by = ?", @current_user.username)
             return render json: projects, each_serializer: SharedProjectSerializer, status: :ok
        elsif params[:filter] == "all"
            user_projects = @current_user.user_projects
        else 
            user_projects = UserProject.where("user_id = ?", @current_user.id).where("completed_status = ?", params[:filter])
        end
        user_projects = user_projects.sort{ |a, b| b.created_at <=> a.created_at }
        return render json: user_projects, status: :ok
    end

    def check_in_collection
        user_projects = @current_user.user_projects
        user_project = user_projects.find_by(project_id: params[:project_id].to_i) 
        if user_project
            render json: {user_project_id: user_project.id}, status: :ok
        else
            render json: {user_project_id: nil }, status: :ok
        end
    end

    #  '/user_projects' creates a user_project when user "adds" project to their list, increments project "adds" count by 1.
    def create
        user_project = UserProject.create!(user_id: @current_user.id, project_id: user_project_params[:project_id], completed_status: user_project_params[:completed_status])
        adds = user_project.project.adds += 1
        user_project.project.update!(adds: adds)
        render json: user_project, status: :created
    end

    #  delete '/user_projects/:id' will delete a user_project when user "removes" project from their list
    def destroy
        user_project = find_user_project
        user_project.destroy
        head :no_content
    end

    #  patch '/user_projects/:id' will update completed status of user_project
    def update
        user_project = find_user_project
        user_project.update!(update_user_project_params)
        render json: user_project, status: :ok
    end

    private 

    def find_user_project 
        UserProject.find(params[:id])
    end

    def user_project_params 
        params.permit(:project_id, :completed_status)
    end

    def update_user_project_params
        params.permit(:completed_status)
    end

    def correct_user
        return render json: {error: "Not authorized" }, status: :unauthorized unless find_user_project.user_id == @current_user.id
    end

    def render_not_found_response
        render json: { error: "Project not found" }, status: :not_found
    end


end
