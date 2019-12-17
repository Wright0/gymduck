require 'sinatra'
require 'sinatra/contrib/all'
require 'pry'

require_relative('controllers/lessons_controller')
require_relative('controllers/members_controller')

get '/' do
  @members = Member.all()
  @lessons = Lesson.all()
  erb(:index)
end
