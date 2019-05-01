require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/session.rb')

also_reload('./models/*')


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
