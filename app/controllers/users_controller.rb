class UsersController < ApplicationController
    skip_before_action :authorize, only: [:create]

    # '/me' checks for logged in user
    def show 
        render json: @current_user, status: :ok
    end

    
    # '/signup' creates new user account
    def create
        user = User.create!(user_params)
        session[:user_id] = user.id
        render json: user, status: :created
    end

    # '/users/:id' deletes user account and destroys associated user_projects, but NOT associated projects 
    def destroy
        return render json: {error: "Not authorized" }, status: :unauthorized unless params[:id].to_i == session[:user_id]
        @current_user.destroy
        head :no_content
    end

    private 

    def user_params
        params.permit(:username, :email, :password, :password_confirmation)
    end
    
  


end
