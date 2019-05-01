
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
get '/members/show_member' do
  @member = Member.find_all()
  erb(:"/members/show_member")
end

# new
get '/members/new_member' do
  erb(:"/members/new_member")
end

# create
post '/members/new_member' do
  @member = Member.new(params)
  @member.save()
  redirect to '/members/show_member'
end

# edit
get '/members/edit_member/:id/edit' do
  @member = Member.find(params[:id])
  erb(:"/members/edit_member")
end

# update
post '/members/edit_member/:id' do
  Member.new(params).update
  redirect to '/members/show_member'
end

# destroy

get '/members/show_member/:id/delete' do
  @member = Member.find(params[:id]).delete()


  redirect to '/members/show_member'

end



# SESSION*****************************************
# new
get '/sessions/new_session' do
  erb(:"/sessions/new_session")
end

# create
post '/sessions/new_session' do
  @session = Session.new(params)
  @session.save()
  redirect to '/sessions/show_session'
end

# show
get '/sessions/show_session' do
  @session = Session.show()
  erb(:"/sessions/show_session")
end

get '/sessions/show_attendance/:id' do

  @session = Session.find_session(params[:id])
  @members = @session.members()
  erb(:"/sessions/show_attendance")
end

get '/sessions/time_session' do
  @session = Session.sessions_by_time()
  erb(:"/sessions/time_session")
end

# edit
get '/sessions/edit_session/:id/edit' do
  @sessions = Session.find_session(params[:id])
erb(:"/sessions/edit_session")
end

# update
post '/sessions/edit_session/:id' do
 Session.new(params).update
  redirect to '/sessions/show_session'
end

# destroy
get '/sessions/show_session/:id/delete' do
  @sessions = Session.find_session(params[:id]).delete_session()
redirect to '/sessions/show_session'
end





# bookings***********************************************

# new
get '/bookings/new_booking' do
  @sessions = Session.show()
  @members = Member.find_all()
erb(:"/bookings/new_booking")
end

# create
post '/bookings/new_booking' do
  @booking = Booking.new(params)
  @booking.save()
  redirect to '/bookings/show_booking'
  erb(:"/bookings/new_booking")
end

# show
get '/bookings/show_booking' do
   @booking = Booking.show()
   erb(:"/bookings/show_booking")
end

# edit
get '/bookings/edit_booking/:id/edit' do
   @booking = Booking.find(params[:id])
   @sessions = Session.show()
   @members = Member.find_all()
erb(:"/bookings/edit_booking")
end

# update
post '/bookings/edit_booking/:id' do
  @booking = Booking.new(params).update()
  redirect to '/bookings/show_booking'
end

# destroy

get '/bookings/show_booking/:id/delete' do
  @booking = Booking.find(params[:id]).delete_booking()
  # @booking.delete_booking()
  redirect to '/bookings/show_booking'
end
