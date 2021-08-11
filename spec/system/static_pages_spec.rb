require 'rails_helper'

RSpec.describe 'StaticPages', type: :system do
  before do
    @base_title = 'Ruby on Rails Tutorial Sample App'
  end

  describe 'GET /home' do
    it 'homeページが表示される' do
      visit static_pages_home_path
      expect(page).to have_title "Home | #{@base_title}"
    end
  end

  describe 'GET /help' do
    it 'helpページが表示される' do
      visit static_pages_help_path
      expect(page).to have_title "Help | #{@base_title}"
    end
  end

  describe 'Get #about' do
    it 'aboutページが表示される' do
      visit static_pages_about_path
      expect(page).to have_title "About | #{@base_title}"
    end
  end
end
