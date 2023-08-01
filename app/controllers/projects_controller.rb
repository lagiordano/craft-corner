class ProjectsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

    skip_before_action :authorize, only: [:index, :popular_sample, :show]
   
    #  '/projects' displays all projects to visitors and users with pagination 
    def index
        projects = Project.order(adds: :desc)
        render json: projects, status: :ok
        # render json: projects.paginate(page: params[:page], per_page: 50), status: :ok
    end

    def popular_sample
        projects = Project.order(adds: :desc).first(4)
        if projects
            render json: projects, status: :ok
        else
            render json: { errors: ["Could not access sample of projects"]}, status: :not_found
        end
    end

    # '/:category/projects' displays all projects within the specified category to visitors and users with pagination 
    # def projects_by_category
    #     projects = Project.where("category = ?", params[:category]).order(adds: :desc)
    #     render json: projects, status: :ok
    # end

    #  'projects/:id' displays individual project 
    def show
        project = find_project
        render json: project, status: :ok
    end

    # '/projects' lets user create a project, automatically adds project to their user_projects
    # def create
    #     project = Project.create!(project_params)
    #     project.shared_by = @current_user.username
    #     project.save
    #     UserProject.create!(user_id: @current_user.id, project_id: project.id, completed_status: user_project_params[:completed_status])
    #     render json: project, status: :created
    # end

    def create
        if params[:url]
            new_project = LinkThumbnailer.generate(project_params[:url])
            image = new_project.images.first
            image ? image = image.src : image = nil
        elsif params[:image]
            data = Cloudinary::Uploader.upload(project_params[:image])
            image = data["url"]
        else
            image = nil
        end
        project = Project.create!(url: project_params[:url], title: project_params[:title], description: project_params[:description], image: image, shared_by: @current_user.username, category: project_params[:category])
        UserProject.create!(user_id: @current_user.id, project_id: project.id, completed_status: user_project_params[:completed_status])
        render json: project, status: :created
    end

 

    # '/projects/:id' lets users edit only the projects they have shared
    def update
        if params[:image] 
            data = Cloudinary::Uploader.upload(project_params[:image])
            image = data["url"]
        elsif params[:url]
            new_project = LinkThumbnailer.generate(project_params[:url])
            image = new_project.images.first
            image ? image = image.src : image = nil
        end
        project = find_project
        return render json: {error: "Projects can only be edited by the user who orginally shared them" }, status: :unauthorized unless project.shared_by == @current_user.username
        project.update!(update_project_params)
        project.image = image if image;
        project.save!
        render json: project, status: :ok
    end

    # '/projects/:id' lets users delete only the projects they have shared. If using this - add in cloudinary destroy method also 
    # def destroy
    #     project = find_project
    #     return render json: {error: "Projects can only be edited by the user who orginally shared them" }, status: :unauthorized unless project.shared_by == @current_user.username
    #     project.destroy
    #     head :no_content
    # end

    private 

    def find_project
        Project.find(params[:id])
    end

    def project_params
        params.permit(:url, :category, :title, :description, :image)
    end

    def update_project_params
        params.permit(:url, :category, :title, :description)
    end

    def user_project_params
        params.permit(:completed_status)
    end

    def render_not_found_response
        render json: {errors: ["Project could not be found"] }, status: :not_found
    end

    # def confirm_admin
    #     return render json: {error: "Projects can only be deleted and edited by admin" }, status: :unauthorized unless @current_user.admin
    # end
end

