class UsersController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocesable_entity_response
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_authorized_response

    skip_before_action :authorize, only: [:create]

    # confirm whether user is logged in already
    def show 
        user = User.find(session[:user_id])
        render json: user, status: :ok
    end

    #  creates new user account
    def create
        user = User.create!(user_params)
        render json: user, status: :created
    end

    # user delete's account, destroys associated user_projects, but NOT associated projects 
    def destroy
        user = User.find(params[:id])
        user.destroy
        head :no_content
    end


    private 

    def user_params
        params.permit(:username, :email, :password, :password_confirmation)
    end

    def render_unprocesable_entity_response invalid
        render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
    end
    
    def render_not_authorized_response
        render json: { error: "Not authorized" }, status: :unauthorized
    end

end
