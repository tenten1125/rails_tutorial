require 'rails_helper'

RSpec.describe 'StaticPages', type: :request do
  describe '/' do
    it 'homeページが表示される' do
      get(root_path)
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET /help' do
    it 'helpページが表示される' do
      get(help_path)
      expect(response).to have_http_status(:success)
    end
  end

  describe 'Get #about' do
    it 'aboutページが表示される' do
      get(about_path)
      expect(response).to have_http_status(:ok)
    end
  end
end
