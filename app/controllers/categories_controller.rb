class CategoriesController < ApplicationController

    skip_before_action :authorize

    # '/categories' lists all categories
    def index
        categories = Category.all
        render json: categories, status: :ok
    end

            
end
