
require('sinatra')
require('sinatra/contrib/all')
require_relative('./controllers/bookings_controller.rb')
require_relative('./controllers/members_controller.rb')
require_relative('./controllers/sessions_controller.rb')

also_reload('./models/*')


# index
get '/gym' do
  erb(:index)
end
