require 'rails_helper'

RSpec.describe Post, type: :model do
  current_user = User.first_or_create(email:'www@gmail.com' ,password:'123456' ,password_confirmation: '123456')
  it "has a title" do
    post = Post.new(
      title: '',
      body: 'jshdjhscbdj',
      user: current_user,
      views: 0
    )
    expect(post).to_not be_valid
    post.title = "valid title"
    expect(post).to be_valid
  end

  it "has a body" do
    post = Post.new(
      title: 'valid title',
      body: '',
      user: current_user,
      views: 0
    )
    expect(post).to_not be_valid
    post.body = "valid body"
    expect(post).to be_valid
  end

  it "has a title atleat 10 characters long" do
    post = Post.new(
      title: 'title',
      body: 'jshdjhscbdj',
      user: current_user,
      views: 0
    )
    expect(post).to_not be_valid
    post.title = "valid title"
    expect(post).to be_valid
  end

  it "has  body between 5 to 100 characters" do
    string = 'fe2wHbKh7H6SNUbhFZEiLClKxiK6muLfLYy1NIjPB0t8QxwzZiYcnjfhamoofBKt0PCzHcXJemxdOGwMStz7KXeaf3M0ntShPEfC'
    post = Post.new(
      title: 'valid title',
      body: 'js',
      user: current_user,
      views: 0
    )
    expect(post).to_not be_valid
    post.body = "valid body"
    expect(post).to be_valid

    post = Post.new(
    title: 'valid title',
      body: string,
      user: current_user,
      views: 0
    )
    expect(post).to be_valid
    post.body = string + '1'
    expect(post).to_not be_valid
  end

  it "has numerical views" do
      post = Post.new(
      title: 'valid title',
      body: 'jsdcdcbdch',
      user: current_user,
      views: 0
    )
    expect(post.views).to be_a(Integer)
  end

end
