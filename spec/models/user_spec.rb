require 'rails_helper'

describe User, :type => :model do

  describe '.from_omniauth', :type => :feature do

    before do
      # first, set OmniAuth to run in test mode
      OmniAuth.config.test_mode = true
      # then, provide a set of fake oauth data that
      # omniauth will use when a user tries to authenticate:
      OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new({
                                                                           'uid' => '12345',
                                                                           'provider' => 'google_oauth2',
                                                                           'info' => OmniAuth::AuthHash::InfoHash.new('email' => 'test@lclark.edu', 'name' => 'Test User')})
    end

    it 'should login valid user' do
      visit '/'
      expect(page).to have_link("Login")
      click_link "Login"
      expect(page).to have_link("Test User")
      expect(page).to have_link("Log Out")
    end

    it 'should not login invalid user' do
      OmniAuth.config.mock_auth[:google_oauth2].info.email = 'test@gmail.com'
      visit '/'
      expect(page).to have_link("Login")
      click_link "Login"
      expect(page).to have_link("Login")
      expect(page).to have_content("Please use your lclark email to sign in.")
    end

  end

end
