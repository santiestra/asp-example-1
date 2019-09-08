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

    new_post_name = 'Creating an Article'
    fill_in "Title", with: new_post_name
    fill_in "Content", with: 'Created this article successfully!'

    click_on 'Submit'

    assert_current_path posts_path

    assert_selector 'h1', text: 'Posts'
    assert_selector 'h2', text: new_post_name
  end

  test 'creating a new post without title' do
    visit posts_path

    click_on 'Nuevo Post'

    assert_text 'Title'
    assert_text 'Content'
    assert_text 'Category'

    new_post_name = 'Creating an Article'
    fill_in "Content", with: 'Created this article successfully!'

    click_on 'Submit'

    # assert_current_path new_post_path

    assert_text "can't be blank"
    assert_text 'Hubo errores al crear el post'
  end
end
