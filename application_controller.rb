require 'dotenv/load'
require 'bundler'
Bundler.require

require_relative 'models/model.rb'

class ApplicationController < Sinatra::Base

  get '/' do
    erb :index
  end
  
  post '/result' do
    puts params
    @user_name = params[:name]
    @user_playlist_id = params[:playlist_id]
    
    @user_title = params[:title]
    @user_artist = params[:artist]
    @user_song = Song.new(@user_title,@user_artist,'http://')
    @user_song.get_lyrics
    
    erb :result
  end
  
end
