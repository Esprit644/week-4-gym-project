require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/member.rb')


also_reload('./models/*')


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
