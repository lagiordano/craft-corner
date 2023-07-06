class ApplicationController < ActionController::API
    include ActionController::Cookies

    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocesable_entity_response

    before_action :authorize

   

    private 

    def render_unprocesable_entity_response invalid
        render json: {errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
    end

    def authorize
        @current_user = User.find_by(id: session[:user_id])
        render json: {error: "Not authorized" }, status: :unauthorized unless @current_user
    end

   

end
