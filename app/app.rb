ENV["RACK_ENV"] ||= "development"

require 'sinatra'
require_relative 'data_mapper_setup'

class BookmarkManager < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'

  helpers do
   def current_user
     @current_user ||= User.get(session[:user_id])
   end
 end

 get '/users/new' do
   erb(:sign_up_form)
 end

  post '/users' do
    p params
   user = User.create(email: params[:email], password: params[:password],
    password_confirmation: params[:password_confirmation])
    
   session[:user_id] = user.id
   redirect '/links'
  end

  get '/links' do
    @user = current_user
    @links = Link.all
    erb :links_list, :layout => :layout
  end

  get '/links/new' do
    erb(:new_link)
  end

  post '/links' do
    link = Link.create(title: params[:title], url: params[:url])
    params[:tags].split.each do |tag|
      link.tags << Tag.first_or_create(name: tag)
    end
    link.save
    redirect '/links'
  end

  get '/tags/:name' do
    tag = Tag.first(name: params[:name])
    @links = tag ? tag.links : []
    erb(:links_list)
  end

  run! if app_file == $0
end
