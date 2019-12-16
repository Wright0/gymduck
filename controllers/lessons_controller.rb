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

get '/lessons/new' do #Create new lesson
  @membership_tiers = MembershipTier.all()
  erb(:"/lessons/new")
end

get '/lessons/:id' do #show a specific lesson's page
  @lesson = Lesson.find_by_id(params[:id])
  erb(:"/lessons/show")
end

post '/lessons' do #Save the new lesson
  @lesson = Lesson.new(params)
  @lesson.save()
  redirect to '/lessons'
end
