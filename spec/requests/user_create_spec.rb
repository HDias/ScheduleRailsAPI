# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'UserCreates', type: :request do
  describe 'POST /api/v1/user' do
    context 'as a Guest' do
      it 'Is expected register a User' do
        user_params = { user: attributes_for(:user) }
        post api_v1_user_path, params: user_params

        expect(response.content_type).to eq('application/json; charset=utf-8')
        expect(response).to have_http_status(:created)
      end

      it 'Is expected do not register User without name' do
        user_params = { user: attributes_for(:user, name: '') }
        post api_v1_user_path, params: user_params
        
        expect(response.content_type).to eq('application/json; charset=utf-8')
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
