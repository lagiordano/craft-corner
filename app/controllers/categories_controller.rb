class CategoriesController < ApplicationController

    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

    def index
        categories = Category.all
        render json: categories, status: :ok
    end

    def show 
        category = Category.find(params[:id])
        render json: category, status: :ok
    end

    private 

    def render_not_found_response 
        render json: {error: "Category not found" }, status: :not_found
    end
            
end
