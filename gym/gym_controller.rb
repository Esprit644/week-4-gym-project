
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
post '/edit_member/:id/edit' do
  Member.new(params).update
  redirect to '/show_member'
end

# destroy

get '/show_member/:id/delete' do
  @memb = Member.find(params[:id])
  # binding.pry
  @memb.delete()
  # Member.delete(@member)
  # binding.pry
  # nil
  erb(:show_member)
end
