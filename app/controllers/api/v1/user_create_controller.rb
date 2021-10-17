# frozen_string_literal: true

module Api
  module V1
    # Create User wihout authentication
    class UserCreateController < V1::BaseController
      include UserSanitize

      def create
        user = User.new(user_params)
        success = user.save
        status = :created
        result = user
        unless success
          result = user.errors
          status = :unprocessable_entity
        end

        render json: [success: success, data: result], status: status
      rescue StandardError => e
        render json: [success: false, data: e.message], status: :internal_server_error
      end
    end
  end
end
