require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/booking.rb')

also_reload('./models/*')

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
