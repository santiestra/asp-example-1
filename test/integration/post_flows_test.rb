require 'test_helper'

class PostFlowsTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  test 'can see the post pages' do
    get '/posts'

    assert_response :success

    assert_select 'h1', 'Posts'
    assert_select 'a', 'Nuevo Post'
    assert_select 'h2', 'MyString'
  end

  test 'can create post' do
    get '/posts/new'

    assert_response :success

    new_post_name = 'Test Post'

    post "/posts", params: {
      post: { title: new_post_name, content: 'test content.', date: DateTime.current, category_id: Category.first.id }
    }

    assert_response :redirect
    follow_redirect!
    assert_response :success
    assert_select 'h2', new_post_name
  end
end
