require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/member.rb')


also_reload('./models/*')


#show
get '/members/show' do
  @member = Member.find_all()
  erb(:"/members/show_member")
end

# new
get '/members/new' do
  erb(:"/members/new_member")
end

# create
post '/members' do
  @member = Member.new(params)
  @member.save()
  redirect to '/members/show'
end

# edit
get '/members/:id/edit' do
  @member = Member.find(params[:id])
  erb(:"/members/edit_member")
end

# update
post '/members/:id' do
  Member.new(params).update
  redirect to '/members/show'
end

# destroy

get '/members/:id/delete' do
  @member = Member.find(params[:id]).delete()
  redirect to '/members/show'

end
