require 'rails_helper'

RSpec.describe "posts/edit", type: :view do
    current_user = User.first_or_create(email:'www@gmail.com' ,password:'123456' ,password_confirmation: '123456')

  before(:each) do
    @post = assign(:post, Post.create!(
      title: "MyStringwdwdwdw",
      body: "MyText",
      user: current_user,
      views: 1
    ))
  end

  it "renders the edit post form" do
    render

    assert_select "form[action=?][method=?]", post_path(@post), "post" do

      assert_select "input[name=?]", "post[title]"

      assert_select "textarea[name=?]", "post[body]"

      assert_select "form input", 3

      expect(response.body).to include @post.title

      expect(controller.controller_path).to eq("posts")

      expect(controller.request.path_parameters[:controller]).to eq("posts")

      expect(controller.request.path_parameters[:action]).to eq("edit")

      # expect(controller.request.path_parameters[:action]).to be_nil

    end
  end
end
