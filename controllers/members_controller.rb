require( 'sinatra' )
# require( 'sinatra/contrib/all' )
require_relative( '../models/member.rb' )
# also_reload( '../models/*' )


post '/members/:memberid/:lessonid/delete' do #Delete a member from a lesson from the user page (delete the booking)
  @booking = Booking.find_by_other_ids(params[:lessonid], params[:memberid])
  @booking.delete()
  id = params[:memberid]
  redirect to "/members/#{id}"
end

get '/members' do # show all
  @members = Member.all()
  erb(:"members/index")
end

get '/members/new' do #Creating a new member
  @membership_tiers = MembershipTier.all()
  erb(:"members/new")
end

post '/members' do #Saving the new member
  @member = Member.new(params)
  @member.save()
  id = @member.id
  redirect to "/members/#{id}"
end

get '/members/:id/edit' do #Edit existing member
  @member = Member.find_by_id(params[:id])
  @membership_tiers = MembershipTier.all()
  erb(:"members/edit")
end

get '/members/:id' do # show member profile
  @member = Member.find_by_id(params[:id])
  @booked_lessons = @member.lessons()
  erb(:"members/show")
end

post '/members/:id/change-status' do #Toggle between active and inactive
  member = Member.find_by_id(params[:id])
  member.set_membership_status()
  id = member.id
  redirect to "/members/#{id}"
end

post '/members/:id' do #update member information
  member = Member.new( params )
  member.update()
  id = member.id
  redirect to "/members/#{id}"
end
