require 'test_helper'

class ImageTest < ActiveSupport::TestCase
  test 'valid image with valid url' do
    image = Image.new(url: 'https://github.com/ProbablyFaiz.png')
    assert image.valid?
  end

  test 'invalid image when url is nil' do
    image = Image.new(url: nil)
    assert image.invalid?
    assert_equal(image.errors.full_messages, ['Url is an invalid URL'])
  end

  test 'invalid image when url is wrong type' do
    image = Image.new(url: 'ftp://example.com/test.png')
    refute image.valid?
    assert_equal(image.errors.full_messages, ['Url is an invalid URL'])
  end

  test 'invalid image when url is not url' do
    image = Image.new(url: 'hello')
    refute image.valid?
    assert_equal(image.errors.full_messages, ['Url is an invalid URL'])
  end
end
