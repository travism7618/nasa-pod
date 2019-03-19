require 'dotenv/load'
require 'bundler'
Bundler.require

require_relative 'models/model.rb'

class ApplicationController < Sinatra::Base

  get '/' do
    erb :index
  end
  
  post '/result' do
    @user_date= params[:user_date]
    @result=Pod.new(@user_date)
    puts "from controller:"
    puts @result.title
    erb :result
  end
  
  
  
end
