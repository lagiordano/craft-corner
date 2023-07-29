class UsersController < ApplicationController
    skip_before_action :authorize, only: [:create]

    # '/me' checks for logged in user
    def show 
        user = @current_user
        render json: user, status: :ok
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
        session.delete :user_id
        head :no_content
    end

    # /users/:id updates user account details - username and email only
    def update 
        return render json: {error: "Not authorized" }, status: :unauthorized unless params[:id].to_i == session[:user_id]
        user = User.find(params[:id])
        user.update!(update_user_params);
        render json: user, status: :ok
    end


    private 

    def user_params
        params.permit(:username, :email, :password, :password_confirmation)
    end

    def update_user_params
        params.permit(:username, :email)
    end
    
  


end
