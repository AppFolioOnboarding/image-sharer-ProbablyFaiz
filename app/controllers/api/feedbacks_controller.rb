module Api
  class FeedbacksController < ApplicationController
    def create
      @feedback = Feedback.new(feedback_params)

      if @feedback.save
        render json: { message: 'Feedback successfully sent.' }, status: :ok
      else
        render json: { message: @feedback.errors.full_messages.join(', ') }, status: :unprocessable_entity
      end
    end

    private

    def feedback_params
      params.require(:feedback).permit(:name, :message)
    end
  end
end
