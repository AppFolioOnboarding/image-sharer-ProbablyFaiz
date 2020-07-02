require 'test_helper'

class FeedbackTest < ActiveSupport::TestCase
  test 'feedback with name and message should be valid' do
    feedback = Feedback.new(name: 'Faiz', message: 'This is a terrible product.')
    assert feedback.valid?
  end

  test 'feedback with no name should not be valid' do
    feedback = Feedback.new(message: 'This is a terrible product.')
    assert feedback.invalid?
    assert_equal(feedback.errors.full_messages, ["Name can't be blank"])
  end

  test 'feedback with no message should not be valid' do
    feedback = Feedback.new(name: 'Faiz')
    assert feedback.invalid?
    assert_equal(feedback.errors.full_messages, ["Message can't be blank"])
  end
end
