require 'rails_helper'

RSpec.describe "users/users", type: :view do
    current_user = User.first_or_create(email:'www@gmail.com' ,password:'123456' ,password_confirmation: '123456')

  before(:each) do
    assign(:users, [
      User.create!(
       email:'gdyd@gmail.com',
       password:'123456',
       password_confirmation: '123456'
      ),
      User.create!(
      	id:49,
       email:'w3@gmail.com',
       password:'123456',
       password_confirmation: '123456'
      )
    ])
  end

  it "renders a list of users" do
    render 
    assert_select "tr>td", text: "gdyd@gmail.com".to_s, count: 1
    assert_select "tr>td", text: "w3@gmail.com".to_s, count: 1
    expect(rendered).to match(/@gmail.com/)
    expect(rendered).to match(/49/)
  end
   it "renders the <table>" do
    render

    expect(rendered).to match /<table>/
  end
end
