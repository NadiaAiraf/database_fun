require 'sinatra/base'
require './lib/bookmark'

class BookmarkManager < Sinatra::Base
  enable :sessions

  get '/' do

    erb :index
  end

  get '/bookmarks' do
    @bookmark = Bookmark.new
    erb :bookmarks
  end

  get '/bookmark' do
    erb :add_bookmark
  end

  post '/bookmark' do
    Bookmark.new.add_bookmark(params[:url])
    redirect '/bookmarks'
  end

  run! if app_file == $0
end
