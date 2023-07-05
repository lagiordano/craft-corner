class CategoriesController < ApplicationController

    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

    skip_before_action :authorize

    # lists categories
    def index
        categories = Category.all
        render json: categories, status: :ok
    end

    # displays projects within a category - with pagination 
    def show 
        category = Category.find(params[:id])
        render json: category.projects.paginate(page: params[:page], per_page: 10), status: :ok
    end

    private 

    def render_not_found_response 
        render json: {error: "Category not found" }, status: :not_found
    end
            
end
