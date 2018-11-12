require 'sinatra'
require_relative "poker1.rb"
enable :sessions
get '/' do
  erb :poker
end

post '/poker' do


end


