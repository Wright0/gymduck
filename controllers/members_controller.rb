require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/member.rb' )
also_reload( '../models/*' )

get '/members' do # show all
  @members = Member.all()
  erb(:"members/index")
end

get '/members/new' do #Creating a new member
  erb(:"members/new")
end

post '/members' do #Saving the new member
  @member = Member.new(params)
  @member.save()
  redirect to '/members'
end

get '/members/:id/edit' do #Edit existing member
  @member = Member.find_by_id(params[:id])
  @membership_tiers = MembershipTier.all()
  erb(:"members/edit")
end

get '/members/:id' do # show member profile
  @member = Member.find_by_id(params[:id])
  erb(:"members/show")
end

post '/members/:id/change-status' do #Toggle between active and inactive
  member = Member.find_by_id(params[:id])
  member.set_membership_status
  redirect to '/members'
end

post '/members/:id' do #update member information
  Member.new( params ).update
  redirect to '/members'
end
