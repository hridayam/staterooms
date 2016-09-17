class CommentsController < ApplicationController
	def create
		@post = Post.find(params[:post_id])
		@comment = @post.comments.create(comment_params)
		logger.debug "CREATING NEW COMMENT  #{comment_params}"
		redirect_to post_path(@post)
	end
	private
		def comment_params
			params.require(:comment).permit(:user_id, :body)
		end
end
