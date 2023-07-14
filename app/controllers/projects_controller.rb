class ProjectsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

    skip_before_action :authorize, only: [:index, :projects_by_category, :show]
   
    #  '/projects' displays all projects to visitors and users with pagination 
    def index
        projects = Project.all
        render json: projects.paginate(page: params[:page], per_page: 50), status: :ok
    end

    # '/:category/projects' displays all projects within the specified category to visitors and users with pagination 
    def projects_by_category
        projects = Project.where("category = ?", params[:category])
        render json: projects.paginate(page: params[:page], per_page: 50), status: :ok
    end

    #  'projects/:id' displays individual project 
    def show
        project = find_project
        render json: project, status: :ok
    end

    # '/projects' lets user create a project, automatically adds project to their user_projects
    def create
        project = Project.create!(project_params)
        project.shared_by = @current_user.username
        project.save
        UserProject.create!(user_id: @current_user.id, project_id: project.id, completed_status: user_project_params[:completed_status])
        render json: project, status: :created
    end

    # '/projects/:id' lets users edit only the projects they have shared
    def update
        project = find_project
        return render json: {error: "Projects can only be edited or deleted by the user who orginally shared them" }, status: :unauthorized unless project.shared_by == @current_user.username
        project.update!(project_params)
        render json: project, status: :ok
    end

    # '/projects/:id' lets users delete only the projects they have shared 
    def destroy
        project = find_project
        return render json: {error: "Projects can only be edited or deleted by the user who orginally shared them" }, status: :unauthorized unless project.shared_by == @current_user.username
        project.destroy
        head :no_content
    end

    private 

    def find_project
        Project.find(params[:id])
    end

    def project_params
        params.permit(:title, :description, :url, :image, :category)
    end

    def user_project_params
        params.permit(:completed_status)
    end

    def render_not_found_response
        render json: {error: "Project not found" }, status: :not_found
    end

    # def confirm_admin
    #     return render json: {error: "Projects can only be deleted and edited by admin" }, status: :unauthorized unless @current_user.admin
    # end
end

