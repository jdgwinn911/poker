require 'sinatra'
require_relative "poker2.rb"
enable :sessions
get '/' do
  erb :poker
end

post '/poker' do
redirect '/'

end


