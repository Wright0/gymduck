require( 'sinatra' )
require( 'sinatra/contrib/all' )

require_relative( '../models/lesson.rb' )
also_reload( '../models/*' )


get '/lessons' do
  erb(:index)
end
