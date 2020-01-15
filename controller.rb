# frozen_string_literal: true

require 'sinatra/base'
require './lib/bookmark'

class Bookmark_Manager < Sinatra::Base
  enable :sessions
  set :session_store, Rack::Session::Pool

  get '/' do
    erb(:index)
  end

  get '/bookmark' do
    session[:list] = Bookmark.all
    erb(:bookmark)
  end

  post '/add' do
    Bookmark.create(title: params[:create_title], url: params[:create_url])
    redirect '/bookmark'
  end

  post '/delete' do
    Bookmark.delete(id: params[:bookmark_id])
    redirect '/bookmark'
  end

  run! if app_file == $PROGRAM_NAME
end
