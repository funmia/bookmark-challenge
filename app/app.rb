ENV["RACK_ENV"] ||= "development"

require 'sinatra'
require './app/models/link'

class BookmarkManager < Sinatra::Base

  get '/' do
    "hello"
  end

  get '/links' do
    @links = Link.all
    erb(:links_list)
  end

  get '/links/new' do
    erb(:new_link)
  end

  post '/links' do
    Link.create(title: params[:title], url: params[:url])
    redirect '/links'
  end


end
