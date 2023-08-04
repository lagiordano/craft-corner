class UsersController < ApplicationController
    skip_before_action :authorize, only: [:create]
    before_action :correct_user, only: [:destroy, :update]

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
        @current_user.destroy
        session.delete :user_id
        head :no_content
    end

    # /users/:id updates user account details - username and email only
    def update 
        user = User.find(params[:id])
        user.update!(update_user_params);
        render json: user, status: :ok
    end


    private 

    def correct_user 
        return render json: {error: "Not authorized" }, status: :unauthorized unless params[:id].to_i == session[:user_id]
    end

    def user_params
        params.permit(:username, :email, :password, :password_confirmation)
    end

    def update_user_params
        params.permit(:username, :email)
    end
    
  


end
