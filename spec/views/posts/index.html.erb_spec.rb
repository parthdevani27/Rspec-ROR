require 'rails_helper'

RSpec.describe "posts/index", type: :view do
    current_user = User.first_or_create(email:'www@gmail.com' ,password:'123456' ,password_confirmation: '123456')

  before(:each) do
    assign(:posts, [
      Post.create!(
        title: "TitlTitlee",
        body: "MyText",
        user: current_user,
        views: 14
      ),
      Post.create!(
        title: "TitlTitlee",
        body: "MyText",
        user: current_user,
        views: 12
      )
    ])
  end

  it "renders a list of posts" do
    render
    assert_select "tr>td", text: "TitlTitlee".to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
    assert_select "tr>td", text: current_user.id.to_s, count: 2
    assert_select "tr>td", text: 14.to_s, count: 1
    assert_select "tr>td", text: 12.to_s, count: 1
  end
end
