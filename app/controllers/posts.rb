require 'byebug'

get '/posts' do
	if session[:id] != nil
		@user = User.find(session[:id])
		@posts = Post.all
		erb :"post/index"
	else
		@posts = Post.all
		erb :"post/index"
	end
end

get '/posts/new' do
	@post = Post.new
	erb :"post/new"
end

post '/posts/create' do
	@user = User.find(session[:id])
	@post = Post.new(title: params["title"], content: params["content"], url: params["url"], user_id: @user.id)
	if @post.check_consistency(params["content"], params["url"]) == true
		@post.save
		redirect to "/posts"
	else
		@error = "Please fill in only one field from content or url. Title cannot be empty!"
		erb :"post/new"
	end
end

get '/posts/:id' do
	@post = Post.find(params[:id])
	@comments = @post.comments
	@count = @comments.count
	erb :"post/show"
end