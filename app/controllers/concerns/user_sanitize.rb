# frozen_string_literal: true

# :nodoc:
module UserSanitize
  extend ActiveSupport::Concern
  def user_params
    params.require(:user)
          .permit(:name, :email, :password)
  end
end
