require 'rails_helper'

RSpec.describe 'projects API', type: :request do
  # Test suite for GET /api/projects
  describe 'GET /api/projects' do
    # make HTTP get request before each example
    before { get '/api/projects' }

    it 'returns projects' do
      # Note `json` is a custom helper to parse JSON responses
      expect(json).not_to be_empty
      expect(json.size).to be >= 0
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end


  # Test suite for POST /api/projects/create
  describe 'POST /api/projects/create' do
    # valid payload
    let(:valid_attributes) { { name: 'ToDo list' } }

    context 'when the request is valid' do
     
      before { post '/api/projects/create', params: valid_attributes ,'CONTENT_TYPE' => 'application/json'}

      it 'creates a project' do
        expect(json['name']).to eq('ToDo list')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/api/projects/create', params: { name: '' },'CONTENT_TYPE' => 'application/json' }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns status code 400' do
        expect(response).to have_http_status(400)
      end

      it 'returns a validation failure message' do
        expect(json["error"])
          .to match(/name is missing/)
      end
    end
  end



# Test suite for GET /api/projects
describe 'GET /api/projects/:projectId/report' do
    let(:projectId) { 5 }

    # make HTTP get request before each example
    before { get "/api/projects/#{projectId}/report" }

    it 'returns tasks by project' do
      # Note `json` is a custom helper to parse JSON responses
      expect(json).not_to be_empty
      expect(json.size).to be >= 0
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end


  
end
