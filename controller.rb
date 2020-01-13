# frozen_string_literal: true

require 'sinatra/base'
require './lib/bookmark_list'
require './lib/bookmark'

class Bookmark_Manager < Sinatra::Base
  enable :sessions
  set :session_store, Rack::Session::Pool

  get '/' do
    erb(:index)
  end

  get '/bookmark' do
    @bookmark_list = BookmarkList.new(Bookmark)
    @list = @bookmark_list.show_bookmarks
    erb(:bookmark)
  end

  run! if app_file == $0
end
