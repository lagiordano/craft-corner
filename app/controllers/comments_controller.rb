class CommentsController < ApplicationController

    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
 
    # def index 
    #     comments = Comment.all
    #     render json: comments, status: :ok
    # end

    def create
        comment = Comment.create!(user_id: @current_user.id, project_id: comment_params[:project_id], comment_text: comment_params[:comment_text])
        render json: comment, status: :created
    end

    def destroy 
        comment = Comment.find(params[:id])
        return render json: {error: "Not authorized" }, status: :unauthorized unless comment.user_id == @current_user.id
        comment.destroy
        head :no_content
    end


    private 

    def comment_params 
        params.permit(:comment_text, :project_id)
    end

    def render_not_found_response
        render json: { error: "Comment not found" }, status: :not_found
    end

end
