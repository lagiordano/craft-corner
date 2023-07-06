class SessionsController < ApplicationController
    skip_before_action :authorize, only: [:create]

    # '/login' authenticates user email and password and stores user_id in session
    def create
        user = User.find_by(email: params[:email].downcase)
        if user&.authenticate(params[:password])
            session[:user_id] = user.id
            render json: user, status: :ok
        else
            render json: { error: "Invalid username or password" }, status: :unauthorized
        end
    end

    # '/logout' removes user_id from session
    def destroy
        session.delete :user_id
        head :no_content
    end


end
