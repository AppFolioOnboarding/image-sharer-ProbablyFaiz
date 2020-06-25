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

  test 'image with tag_list has correct tags' do
    image = Image.new(url: 'https://github.com/ProbablyFaiz.png', tag_list: 'github, profile_pic,test')
    assert image.tag_list.is_a?(Array) # It should be transformed into an array by acts_as_taggable_on
    assert image.tag_list.include?('github')
    assert image.tag_list.include?('profile_pic')
    assert image.tag_list.include?('test')
  end

  test 'image without tag_list has no tags' do
    image = Image.new(url: 'https://github.com/ProbablyFaiz.png')
    assert_empty image.tag_list
  end
end
