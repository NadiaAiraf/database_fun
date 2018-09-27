require 'sinatra/base'
require './lib/bookmark'
require 'sinatra/flash'
require 'uri'

class BookmarkManager < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

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
    if Bookmark.new.check_url(params['url'])
      Bookmark.new.add_bookmark(params[:url])
      redirect '/bookmarks'
    else
      flash[:notice] = "You must submit a valid URL, dumbass"
      redirect '/bookmark'
    end
  end

  post '/delete' do
    Bookmark.new.delete_bookmark(params.keys[0])
    redirect '/bookmarks'
  end

  get '/update' do
    session[:update] = params.keys[0]
    erb :update_bookmark
  end

  post '/update' do
    Bookmark.new.update_bookmark(session[:update], params[:url])
    redirect '/bookmarks'
  end

  run! if app_file == $0
end
