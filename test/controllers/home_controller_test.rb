require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  test 'index page displays hello world' do
    get '/'
    assert_response :success
    assert_select 'h1', 'Hello, world!'
  end
end
