require 'sinatra/base'
require 'sinatra/reloader'
require './lib/bookmarks'

class BookmarkManager < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  enable :sessions, :method_override

  get '/' do
    erb :index
  end

  get '/bookmarks' do
    @bookmarks = Bookmarks.list_bookmarks
    erb :bookmarks
  end

  # need to link /bookmarks to /bookmarks/new

  get '/bookmarks/new' do
    erb :new
  end

  post '/bookmarks' do
    Bookmarks.create(url: params[:url], title: params[:title])
    redirect '/bookmarks'
  end

  delete '/bookmarks/:id' do
    Bookmarks.delete(id: params[:id])
    redirect '/bookmarks'
  end

  run! if app_file == $0
end
