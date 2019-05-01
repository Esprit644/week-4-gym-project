require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/booking.rb')

also_reload('./models/*')

# bookings***********************************************

# new
get '/bookings/new' do
  @sessions = Session.show()
  @members = Member.find_all()
erb(:"/bookings/new_booking")
end

# create
post '/bookings' do
  @booking = Booking.new(params)
  @booking.save()
  redirect to '/bookings/show'
  erb(:"/bookings/new_booking")
end

# index
# show - Restful could not be used as no :id required. Left '/show' for info
get '/bookings/show' do
   @booking = Booking.show()
   erb(:"/bookings/show_booking")
end

# edit
get '/bookings/:id/edit' do
   @booking = Booking.find(params[:id])
   @sessions = Session.show()
   @members = Member.find_all()
erb(:"/bookings/edit_booking")
end

# update
post '/bookings/:id' do
  @booking = Booking.new(params).update()
  redirect to '/bookings/show'
end

# destroy

get '/bookings/:id/delete' do
  @booking = Booking.find(params[:id]).delete_booking()
  # @booking.delete_booking()
  redirect to '/bookings/show'
end
