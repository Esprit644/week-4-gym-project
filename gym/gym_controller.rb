
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




# ******MEMBERS***************************



# show
get '/show_member' do
  @member = Member.find_all()
  erb(:show_member)
end

# new
get '/new_member' do
  erb(:new_member)
end

# create
post '/new_member' do
  @member = Member.new(params)
  @member.save()
  redirect to '/show_member'
end

# edit
get '/edit_member/:id/edit' do
  @member = Member.find(params[:id])
  erb(:edit_member)
end

# update
post '/edit_member/:id' do
  Member.new(params).update
  redirect to '/show_member'
end

# destroy

get '/show_member/:id/delete' do
  @member = Member.find(params[:id]).delete()


  redirect to '/show_member'

end



# SESSION*****************************************
# new
get '/new_session' do
  erb(:new_session)
end

# create
post '/new_session' do
  @session = Session.new(params)
  @session.save()
  redirect to '/show_session'
end

# show
get '/show_session' do
  @session = Session.show()
  erb(:show_session)
end

# edit
get '/edit_session/:id/edit' do
  @sessions = Session.find_session(params[:id])
  # binding.pry
erb(:edit_session)
end

# update
post '/edit_session/:id' do
 Session.new(params).update
  redirect to '/show_session'
end

# destroy
get '/show_session/:id/delete' do
  @sessions = Session.find_session(params[:id]).delete_session()
redirect to '/show_session'
end



# bookings***********************************************

# new
get '/new_booking' do
erb(:show_booking)
end

# create

# show
get '/show_booking' do
   @booking = Booking.show()
erb(:show_booking)
end



get '/show_booking/:id' do
   @booking = Booking.find(params[:id])
erb(:show_booking)
end
# edit

# get 'edit_booking/:id/edit' do
#   @booking =
# end

# update

# destroy

get '/show_booking/:id/delete' do
  @booking = Booking.find(params[:id]).delete_booking()
  # @booking.delete_booking()
  redirect to '/show_booking'
end
