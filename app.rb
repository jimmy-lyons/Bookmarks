require 'sinatra/base'
require 'sinatra/reloader'
require './lib/bookmarks'
require './database_connection_setup'
require 'uri'
require 'sinatra/flash'

class BookmarkManager < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  enable :sessions, :method_override
  register Sinatra::Flash

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
    flash[:notice] = "You must submit a valid URL." unless Bookmarks.create(url: params[:url], title: params[:title])
    redirect '/bookmarks'
  end

  delete '/bookmarks/:id' do
    Bookmarks.delete(id: params[:id])
    redirect '/bookmarks'
  end

  get "/bookmarks/:id/edit" do
    @bookmark = Bookmarks.find(id: params[:id])
    erb :edit    
  end

  patch '/bookmarks/:id' do
    Bookmarks.edit(id: params[:id], url: params[:url], title: params[:title])
    redirect '/bookmarks'
  end

  get '/bookmarks/:id/comments/new' do
    @bookmark_id = params[:id]
    erb :'comments/new'
  end

  post '/bookmarks/:id/comments' do
    connection = PG.connect(dbname: 'bookmark_manager_test')
    connection.exec_params(
      "INSERT INTO comments (text, bookmark_id) VALUES($1, $2);",
      [params[:comment], params[:id]]
      )
    redirect '/bookmarks'
  end

  run! if app_file == $0
end
