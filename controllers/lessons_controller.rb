require( 'sinatra' )
require( 'sinatra/contrib/all' )

require_relative( '../models/lesson.rb' )
also_reload( '../models/*' )


get '/lessons' do # show all
  @lessons = Lesson.all()
  erb(:"lessons/index")
end

get '/lessons/:id/edit' do #Edit existing lesson
  @lesson = Lesson.find_by_id(params[:id])
  @membership_tiers = MembershipTier.all()
  erb(:"lessons/edit")
end

post '/lessons/:id' do #Savings edits to existing lesson
  Lesson.new( params ).update
  redirect to '/lessons'
end

get '/lessons/new' do
  erb(:"/lessons/new")
end

post '/lessons' do
  @lesson = Lesson.new(params)
  @lesson.save()
  redirect to '/lessons'
end
