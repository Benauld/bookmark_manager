# frozen_string_literal: true

require 'sinatra/base'
require './lib/bookmark_list'

class Bookmark < Sinatra::Base
  enable :sessions
  set :session_store, Rack::Session::Pool

  get '/' do
    erb(:index)
  end

  get '/bookmark' do
    @bookmark_list = BookmarkList.new
    erb(:bookmark)
  end

  run! if app_file == $0
end
