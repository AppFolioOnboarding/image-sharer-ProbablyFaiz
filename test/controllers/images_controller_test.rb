require 'test_helper'

class ImagesControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get images_url
    assert_response :success
  end

  test 'should show images index at root' do
    get root_url
    assert_response :success
    assert_select 'div.image-list'
  end

  test 'should show images in order on index' do
    image1 = Image.create(url: 'https://github.com/ProbablyFaiz.png', created_at: DateTime.now - 10)
    image2 = Image.create(url: 'https://github.com/bhargav265.png', created_at: DateTime.now - 20)
    image3 = Image.create(url: 'https://github.com/n-wach.png', created_at: DateTime.now - 30)
    get images_path
    assert_response :success
    assert_select 'div.image-list > a:nth-child(1)' do
      assert_select format('img[src="%<url>s"]', url: image1.url)
      assert_select format('a[href="%<url>s"]', url: image_path(image1))
    end
    assert_select 'div.image-list > a:nth-child(2)' do
      assert_select format('img[src="%<url>s"]', url: image2.url)
      assert_select format('a[href="%<url>s"]', url: image_path(image2))
    end
    assert_select 'div.image-list > a:nth-child(3)' do
      assert_select format('img[src="%<url>s"]', url: image3.url)
      assert_select format('a[href="%<url>s"]', url: image_path(image3))
    end
  end

  test 'should get new' do
    get new_image_url
    assert_response :success
    assert_select 'h1', 'New Image'
  end

  test 'should create image for valid url' do
    assert_difference('Image.count', 1) do
      post images_url, params: { image: { url: 'https://github.com/ProbablyFaiz.png' } }
    end
    assert_redirected_to image_url(Image.last)
    follow_redirect!
    assert_select 'p#notice', 'Image was successfully created.'
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

  test 'should show image' do
    image = Image.create(url: 'https://github.com/ProbablyFaiz.png')
    get image_url(image)
    assert_response :success
    assert_select 'img[alt="' + image.url + '"]'
  end

  test 'should redirect to index if image does not exist' do
    get image_url(999)
    assert_redirected_to images_url
    follow_redirect!
    assert_select 'p#notice', 'The specified image could not be found.'
  end
end
