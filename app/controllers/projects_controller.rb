class ProjectsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

    before_action :confirm_admin, only: [:update, :destroy]
   
    #  'categories/:id/projects' OR '/projects' displays all projects or all projects of a certain category to user with pagination 
    def index
        if params[:category_id]
            category = Category.find(params[:category_id])
            projects = category.projects
        else
            projects = Project.all
        end
        render json: projects.paginate(page: params[:page], per_page: 20), status: :ok
    end

    #  'projects/:id' displays individual project 
    def show
        project = find_project
        render json: project, status: :ok
    end

    # '/projects' lets user create a project, automatically adds project to their user_projects
    def create
        project = Project.create!(project_params)
        UserProject.create!(user_id: @current_user.id, project_id: project.id, completed_status: user_project_params[:completed_status])
        render json: project, status: :created
    end

    # '/projects/:id' ADMIN ONLY - updates a project
    def update
        project = find_project
        project.update!(project_params)
        render json: project, status: :ok
    end

    # '/projects/:id' ADMIN ONLY - deletes a project and deletes associated user_projects
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
        params.permit(:title, :description, :url, :image, :category_id)
    end

    def user_project_params
        params.permit(:completed_status)
    end

    def render_not_found_response
        render json: {error: "Project not found" }, status: :not_found
    end

    def confirm_admin
        return render json: {error: "Projects can only be deleted and edited by admin" }, status: :unauthorized unless @current_user.admin
    end
end
