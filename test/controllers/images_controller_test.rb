require 'test_helper'

class ImagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @valid_image_url = images(:valid_image_url)
    @wrong_url_type = images(:wrong_url_type)
    @not_url = images(:not_url)
  end

  # test 'should get index' do
  #   get images_url
  #   assert_response :success
  # end

  test 'should get new' do
    get new_image_url
    assert_response :success
  end

  test 'should create image for valid url' do
    assert_difference('Image.count', 1) do
      post images_url, params: { image: @valid_image_url.as_json }
    end
    assert_redirected_to image_url(Image.last)
  end

  test 'should not create image for non http/s url type' do
    assert_no_difference('Image.count') do
      post images_url, params: { image: @wrong_url_type.as_json }
    end
  end

  test 'should not create image for non url' do
    assert_no_difference('Image.count') do
      post images_url, params: { image: @not_url.as_json }
    end
  end

  test 'should show image' do
    get image_url(@valid_image_url)
    assert_response :success
    assert_select 'img[alt="' + @valid_image_url.url + '"]'
  end
end
