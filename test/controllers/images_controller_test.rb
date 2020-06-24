require 'test_helper'

class ImagesControllerTest < ActionDispatch::IntegrationTest
  test 'should get new' do
    get new_image_url
    assert_response :success
    assert_select 'h1', 'New Image'
  end

  test 'should create image for valid url' do
    assert_difference('Image.count', 1) do
      post images_url, params: { image: { url: 'https://github.com/ProbablyFaiz.png' } }
    end
    assert_redirected_to root_url
  end

  test 'should raise exception for nil image' do
    assert_raise do
      post images_url, params: { image: nil }
    end
  end

  test 'should not create image for nil url' do
    assert_no_difference('Image.count') do
      post images_url, params: { image: { url: nil } }
    end
    assert_select 'span.error', 'is an invalid URL'
  end

  test 'should not create image for non http/s url type' do
    assert_no_difference('Image.count') do
      post images_url, params: { image: { url: 'ftp://example.com/test.png' } }
    end
    assert_select 'span.error', 'is an invalid URL'
  end

  test 'should not create image for non url' do
    assert_no_difference('Image.count') do
      post images_url, params: { image: { url: 'hello' } }
    end
    assert_select 'span.error', 'is an invalid URL'
  end
end
