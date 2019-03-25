require 'dotenv/load'
require 'bundler'
Bundler.require

require_relative 'models/model.rb'

class ApplicationController < Sinatra::Base

# this is the starting point, when the site is first accessed 
  get '/' do
    erb :index
  end
  
  post '/result' do
    
  # makes a new instance of the pod class with the date from the user (taken from the html form index.erb) and makes it accessible to result.erb 
    @result=Pod.new(params[:user_date])
    erb :result
  end
  
  
  
end
