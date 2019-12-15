require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/member.rb' )
also_reload( '../models/*' )

get '/members' do # show all
  @members = Member.all()
  erb(:"members/index")
end

get '/members/:id' do # show member profile
  @member = Member.find_by_id(params[:id])
  erb(:"members/show")
end

post '/members/:id/deactivate' do
  member = Member.find_by_id(params[:id])
  member.set_membership_status
  redirect to '/members'
end
