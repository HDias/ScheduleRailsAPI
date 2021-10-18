# frozen_string_literal: true

# Format response to controller with model roles
module ResponseModelJson
  extend ActiveSupport::Concern
  # rubocop:disable Layout/TrailingWhitespace
  def model_process(model)
    return { result: { success: false, data: model.errors }, status: :unprocessable_entity } unless model.save
    
    { result: { success: true, data: model }, status: :created }
  end
  # rubocop:enable Layout/TrailingWhitespace
end
