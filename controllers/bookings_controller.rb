require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/booking.rb' )
require_relative( '../models/lesson.rb' )
require_relative( '../models/member.rb' )
also_reload( '../models/*' )

get '/bookings' do # show all
  @bookings = Booking.all()
  erb(:"bookings/index")
end
