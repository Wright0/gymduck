require 'sinatra'
require 'sinatra/contrib/all'
require 'pry'

require_relative('controllers/bookings_controller')
require_relative('controllers/lessons_controller')
require_relative('controllers/members_controller')

get '/' do
  erb(:index)
end
