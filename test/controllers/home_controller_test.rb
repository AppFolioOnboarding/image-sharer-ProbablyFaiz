require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get root_url
    assert_response :success
    assert_select 'h1', 'Hello, world!'
    assert_select 'a', 'New Image'
    assert_select 'a', 'All Images'
  end
end
