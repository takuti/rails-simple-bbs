require 'test_helper'

class PostTest < ActiveSupport::TestCase

  test 'should not save post without both of name and comment' do
    post = Post.new
    post.email = 'foo@bar.com'
    assert_not post.save
  end

  test 'should not save post without name' do
    post = Post.new
    post.email = 'foo@bar.com'
    post.comment = 'hello'
    assert_not post.save
  end

  test 'should not save post without comment' do
    post = Post.new
    post.name = 'Tom'
    post.email = 'foo@bar.com'
    assert_not post.save
  end

  test 'should save post without email' do
    post = Post.new
    post.name = 'Tom'
    post.comment = 'hello'
    assert post.save
  end

  test 'should not save post with invalid email' do
    post = Post.new
    post.name = 'Tom'
    post.email = 'awesome.email'
    post.comment = 'hello'
    assert_not post.save
  end

end
