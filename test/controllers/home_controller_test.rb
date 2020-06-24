require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  test 'index page displays hello world' do
    get root_url
    assert_response :success
    assert_select 'h1', 'Hello, world!'
  end

  test 'index page has new image link' do
    get root_url
    assert_response :success
    assert_select 'a', 'New Image'
  end
end
