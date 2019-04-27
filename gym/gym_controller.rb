
require('sinatra')
require('sinatra/contrib/all')
require_relative('./models/booking.rb')
require_relative('./models/member.rb')
require_relative('./models/session.rb')

also_reload('./models/*')


# index
get '/index' do
  erb(:index)
end

# get '/show_member' do
#   erb(:show_member)
# end

get '/show_session' do
  erb (:show_session)
end


# ******MEMBERS***************************


# show
get '/show_member' do
  @member = Member.find_all()
  erb(:show_member)
end



# new


# create


# edit


# update


# destroy
