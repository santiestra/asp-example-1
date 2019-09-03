require 'application_system_test_case'

class PostsTest < ApplicationSystemTestCase
  test 'visiting the posts index' do
    visit posts_path

    assert_selector 'h1', text: 'Posts'
  end

  test 'creating a new post' do
    visit posts_path

    click_on 'Nuevo Post'

    assert_text 'Title'
    assert_text 'Content'
    assert_text 'Category'

    fill_in "Title", with: 'Creating an Article'
    fill_in "Content", with: 'Created this article successfully!'

    click_on 'Submit'

    assert_current_path posts_path

    assert_selector 'h1', text: 'Posts'
    assert_selector 'h2', text: 'Creating an Article'
  end
end
