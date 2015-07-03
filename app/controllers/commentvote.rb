post '/votes/comment/:id' do
	# byebug
	@user = session[:id]
	@commentvote = CommentVote.new(comment_id: params[:id], user_id: @user)

	@post = Post.find(@commentvote.comment.post.id)

	if @commentvote.save
		redirect to "/posts/#{@post.id}"
	else
		redirect to "/posts/#{@post.id}"
	end
end