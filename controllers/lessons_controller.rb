require( 'sinatra' )
# require( 'sinatra/contrib/all' )
# require ('pry')

require_relative( '../models/lesson.rb' )
require_relative( '../models/booking.rb' )
# also_reload( '../models/*' )

post '/lessons/:lessonid/:memberid/delete' do #Delete a member from a lesson in the show page (delete the booking)
  @booking = Booking.find_by_other_ids(params[:lessonid], params[:memberid])
  @booking.delete()
  id = params[:lessonid]
  redirect to "/lessons/#{id}"
end

get '/lessons' do #Page that shows all - Index
  @lessons = Lesson.all()
  erb(:"lessons/index")
end

get '/lessons/:id/edit' do #Page to edit existing lesson
  @lesson = Lesson.find_by_id(params[:id])
  @membership_tiers = MembershipTier.all()
  erb(:"lessons/edit")
end

get '/lessons/:id/member' do #Page to a member into a lesson
  erb(:"bookings/new")
end

post '/lessons/:id/booking' do #Adds a member to a booking
  booking = Booking.new(params)
  result = booking.complete_booking?()
  @classid = params[:id]
  @memberid = booking.member_id

  if result == 'inactive member'
    erb(:'/lessons/reject-inactive')
  elsif result == 'already in lesson'
  erb(:'/lessons/reject-duplicate')
  elsif result == 'wrong tier'
    erb(:'/lessons/reject-membership')
  elsif result == 'member does not exist'
    erb(:'/lessons/reject-notfound')
  else
    booking.save()
    redirect to "/lessons/#{@classid}"
  end
end

post '/lessons/:id' do #Saves edits to existing lesson
  Lesson.new( params ).update
  redirect to '/lessons'
end

get '/lessons/new' do #Page to create a new lesson
  @membership_tiers = MembershipTier.all()
  erb(:"/lessons/new")
end

get '/lessons/:id' do #Page to show a specific lesson's page
  @lesson = Lesson.find_by_id(params[:id])
  @members = @lesson.members()
  @number_booked = @members.length
  erb(:"/lessons/show")
end

post '/lessons' do #Saves a new lesson
  @lesson = Lesson.new(params)
  @lesson.save()
  redirect to '/lessons'
end
