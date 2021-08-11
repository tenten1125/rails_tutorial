require 'rails_helper'

RSpec.describe 'StaticPages', type: :system do
  before do
    @base_title = 'Ruby on Rails Tutorial Sample App'
  end

  describe 'GET /home' do
    it 'タイトルタブに基本タイトルのみ表示される' do
      visit root_path
      expect(page).to have_title @base_title.to_s
    end
  end

  describe 'GET /help' do
    it 'helpページが表示される' do
      visit help_path
      expect(page).to have_title "Help | #{@base_title}"
    end
  end

  describe 'Get #about' do
    it 'aboutページが表示される' do
      visit about_path
      expect(page).to have_title "About | #{@base_title}"
    end
  end

  describe 'Get #contact' do
    it '適切なタイトルが表示される' do
      visit contact_path
      expect(page).to have_title "Contact | #{@base_title}"
    end
  end
end
