post '/votes/post/:id' do
	@user = session[:id]
	@postvote = PostVote.new(post_id: params[:id], user_id: @user)

	if @postvote.save
		redirect to "/posts"
	else
		redirect to "/posts"
	end
end