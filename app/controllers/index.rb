get '/' do
  @categories = Category.all
  erb :index
end

get '/category/:category_id' do
  @category = Category.find(params[:category_id])
  @posts = @category.posts
  erb :category
end

get '/posts/:post_id' do
  @post = Post.find(params[:post_id])
  @category = Category.find(@post.category_id)
  erb :post
end

post '/category/:category_id/new_post' do
  @post = Post.create(:title => params[:title], :content => params[:content], :key => generate_key, :category_id => params[:category_id])
  redirect "/key/#{@post.key}"
end

get '/key/:key' do
  @post = Post.find_by_key(params[:key])
  @category = Category.find(@post.category_id)
  erb :post_key
end

put '/post/:id' do
  @post = Post.find(params[:id])
  @post.title = params[:title]
  @post.content = params[:content]
  @post.save
  redirect "/posts/" + params[:id]
end

delete '/:id/delete' do
  @post = Post.find(params[:id])
  @category = @post.category_id
  @post.destroy
  redirect "/category/#{@category}"
end