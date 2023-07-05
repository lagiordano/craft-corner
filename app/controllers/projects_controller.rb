class ProjectsController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocesable_entity_response
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

    
   
    #  displays all projects or all projects of a certain category to user
    def index
        if params[:user_id]
            return render json: {error: "Not authorized" }, status: :unauthorized unless params[:user_id].to_i == session[:user_id]
            user = User.find(params[:user_id])
            projects = user.projects
        else
            projects = Project.all
        end
        
        render json: projects.paginate(page: params[:page], per_page: 20), status: :ok
    end

    #  displays indivudal project 
    def show 
        project = find_project
        render json: project, status: :ok
    end

    # user can create project, automatucally adds this to their user_projects
    def create
        user = User.find(session[:user_id])
        project = Project.create!(project_params)
        UserProject.create!(user_id: user.id, project_id: project.id, completed_status: user_project_params[:completed_status])
        render json: project, status: :created
    end

    #  user can update a project - thinking maybe only admin for this? 
    def update
        project = find_project
        project.update!(project_params)
        render json: project, status: :ok
    end

    # user can delete a project - needs to be admin only
    def destroy
        project = find_project
        project.destroy
        head :no_content
    end

    private 

    def find_project
        Project.find(params[:id])
    end

    def project_params
        params.permit(:title, :description, :url, :image, :adds, :category_id)
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
