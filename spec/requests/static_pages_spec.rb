require 'rails_helper'

RSpec.describe 'StaticPages', type: :request do
  describe 'GET /home' do
    it 'homeページが表示される' do
      get(static_pages_home_path)
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /help' do
    it 'helpページが表示される' do
      get(static_pages_help_path)
      expect(response).to have_http_status(:success)
    end
  end

  describe 'Get #about' do
    it 'aboutページが表示される' do
      get(static_pages_about_path)
      expect(response).to have_http_status(:ok)
    end
  end
end
　
