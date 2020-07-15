require 'test_helper'

class FeedbacksControllerTest < ActionDispatch::IntegrationTest
  test 'should create feedback for valid feedback' do
    assert_difference('Feedback.count', 1) do
      post api_feedbacks_url, params: { feedback: { name: 'Faiz', message: 'Just inexcusably bad.' } }
    end
    assert_response :ok
    feedback = Feedback.last
    assert_equal feedback.name, 'Faiz'
    assert_equal feedback.message, 'Just inexcusably bad.'
  end

  test 'should not create feedback with blank name' do
    assert_no_difference('Feedback.count') do
      post api_feedbacks_url, params: { feedback: { name: 'Faiz' } }
    end
    assert_response :unprocessable_entity
    assert_equal JSON.parse(response.body)['message'], "Message can't be blank"
  end

  test 'should not create feedback with blank message' do
    assert_no_difference('Feedback.count') do
      post api_feedbacks_url, params: { feedback: { message: 'Just inexcusably bad.' } }
    end
    assert_response :unprocessable_entity
    assert_equal JSON.parse(response.body)['message'], "Name can't be blank"
  end
end
