require 'sinatra'
require './app/models/link'

class BookmarkManager < Sinatra::Base

  get '/' do
    "hello"
  end

  get '/links' do
    @links_list = Link.get(1).title
    erb(:links_list)
  end


end
