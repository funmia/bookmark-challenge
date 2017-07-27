ENV["RACK_ENV"] ||= "development"

require 'sinatra'
require_relative 'data_mapper_setup'

class BookmarkManager < Sinatra::Base

  get '/' do
    "Bookmark Manager"
  end

  get '/links' do
    @links = Link.all
    erb(:links_list)
  end

  get '/links/new' do
    erb(:new_link)
  end

  post '/links' do
    link = Link.create(title: params[:title], url: params[:url])
    tag = Tag.first_or_create(name: params[:tags])
    link.tags << tag
    link.save
    redirect '/links'
  end


end
