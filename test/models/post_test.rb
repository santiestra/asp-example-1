require 'test_helper'

class PostTest < ActiveSupport::TestCase
  test 'valid post' do
    post = Post.new(
      title: 'Some title',
      content: 'test content for the post',
      date: DateTime.current,
      category: Category.first,
      user: User.first
    )

    assert post.valid?
  end

  test 'post without title' do
    post = Post.new(
      content: 'test content for the post',
      date: DateTime.current,
      category: Category.first,
      user: User.first
    )

    assert_not post.valid?
    assert_not_nil post.errors[:title]
  end

  # Add tests for all the other validations...
end
