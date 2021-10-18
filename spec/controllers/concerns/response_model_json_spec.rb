# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'ResponseModelJson' do
  let(:response_model_json) { Class.new { extend ResponseModelJson } }

  it 'Format with model errors' do
    errors = { "email": ["can't be blank"] }
    user = double('User', save: false, errors: errors)
    result = { "result": {
      "success": false,
      "data": {
        "email": ['can\'t be blank']
      }
    }, "status": :unprocessable_entity }
    expect(response_model_json.model_process(user)).to eq(result)
  end

  it 'Format with sucess model save' do
    user = build(:user)
    result = { "result": {
      "success": true,
      "data": user
    }, "status": :created }
    expect(response_model_json.model_process(user)).to eq(result)
  end
end
