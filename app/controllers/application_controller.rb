
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do

  end

  get '/posts/new' do
    erb :new
  end

  post '/posts' do
    @new_post=Post.create(params)
    @posts = Post.all
    erb :index
  end

  get '/posts' do
    @posts = Post.all
    erb :index
  end

  get '/posts/:id' do
    @post = Post.find(params[:id])
    erb :show
  end

  get '/posts/:id/edit' do
    @post=Post.find(params[:id])
    erb :edit
  end

  patch '/posts/:id' do
    @post = Post.find(params[:id])
    @post.update(name:params[:name], content:params[:content])
    redirect to "/posts/#{@post.id}"
  end

#   patch '/posts/:id' do #edit action
#     @post = Post.find(params[:id])
#     @post.name = params[:name]
#     @post.content = params[:content]
#     @post.save
#   redirect to "/posts/#{@post.id}"
# end

  get '/delete' do
    erb :delete
  end

  delete '/posts/:id/delete' do
    @post=Post.find(params[:id])
    @post.delete
    redirect :delete
  end

end
