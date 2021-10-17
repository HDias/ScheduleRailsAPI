# frozen_string_literal: true

module UserValidator
  extend ActiveSupport::Concern

  included do
    validates :name, presence: true
  end
end
