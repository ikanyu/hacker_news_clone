post '/posts/:id/comments/create' do
	@user = session[:id]
	@comment = Comment.new(comment: params["comment"], post_id: params[:id], user_id: @user)
	if @comment.save
		redirect to "/posts/#{params[:id]}"
	end
end	