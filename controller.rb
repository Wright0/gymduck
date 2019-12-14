require 'sinatra'
require 'sinatra/contrib/all'
require 'pry'

require_relative('./models/member')
also_reload('./models/*')

get '/' do
  erb(:index)
end
