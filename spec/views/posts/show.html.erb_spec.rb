require 'rails_helper'

RSpec.describe "posts/show", type: :view do
    current_user = User.first_or_create(email:'www@gmail.com' ,password:'123456' ,password_confirmation: '123456')

  before(:each) do
    @post = assign(:post, Post.create!(
      title: "TTitleitle",
      body: "MyText",
      user: current_user,
      views: 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
  end
end
