require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/session.rb')

also_reload('./models/*')


# new
get '/session/new' do
  erb(:"/sessions/new_session")
end

# create
post '/session/create' do
  @session = Session.new(params)
  @session.save()
  redirect to '/sessions/show'
end

# show
get '/sessions/show' do
  @session = Session.show()
  erb(:"/sessions/show_session")
end

get '/attendance/show/:id' do

  @session = Session.find_session(params[:id])
  @members = @session.members()
  erb(:"/sessions/show_attendance")
end

get '/time/show' do
  @session = Session.sessions_by_time()
  erb(:"/sessions/time_session")
end

# edit
get '/sessions/edit/:id/edit' do
  @sessions = Session.find_session(params[:id])
erb(:"/sessions/edit_session")
end

# update
post '/sessions/update/:id' do
 Session.new(params).update
  redirect to '/sessions/show'
end

# destroy
get '/sessions/delete/:id' do
  @sessions = Session.find_session(params[:id]).delete_session()
redirect to '/sessions/show'
end
