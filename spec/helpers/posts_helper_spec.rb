require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the PostsHelper. For example:
#
# describe PostsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
include PostsHelper
RSpec.describe PostsHelper, type: :helper do
	it  "assign a user to post " do 
	  creator = User.first_or_create(email:'www@gmail.com' ,password:'123456' ,password_confirmation: '123456')
	  @post = Post.new(title:'gggghhhhjul',body:'hygytf',views:0)
	  returned_post = assign_post_creator(@post,creator)
	  expect(returned_post.user).to be(creator)
	end
end
