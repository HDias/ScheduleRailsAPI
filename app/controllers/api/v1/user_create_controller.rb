# frozen_string_literal: true

module Api
  module V1
    # Create User wihout authentication
    class UserCreateController < V1::BaseController
      include UserSanitize
      include ResponseModelJson
      before_action :user_model

      def create
        user = @user_model.new(user_params)
        model_process = model_process(user)

        render json: model_process[:result], status: model_process[:status]
      rescue StandardError => e
        render json: { success: false, data: e.message }, status: :internal_server_error
      end

      def user_model(user_model = User)
        @user_model ||= user_model
      end
    end
  end
end
