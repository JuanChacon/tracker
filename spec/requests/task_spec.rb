# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'tasks API', type: :request do
  # make HTTP get request before each example
  before { get '/api/tasks' }

  it 'returns projects' do
    # Note `json` is a custom helper to parse JSON responses
    expect(json).not_to be_empty
    expect(json.size).to be >= 0
  end

  it 'returns status code 200' do
    expect(response).to have_http_status(200)
  end

  # Test suite for POST /api/tasks/assign
  describe 'POST /api/tasks/assign' do
    # valid payload
    let(:valid_attributes) { {
        "taskId": 1,
        "projectId": 1
    } }

    context 'when the request is valid' do
      before { post '/api/tasks/assign', params: valid_attributes }

      it 'assign a project to task' do
        expect(json).not_to be_empty
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end
  end
end
