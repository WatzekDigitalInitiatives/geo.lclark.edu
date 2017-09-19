require 'rails_helper'

describe CallbacksController do

  describe '/POST from google_oauth2' do

    before do
      @request.env['devise.mapping'] = Devise.mappings[:user]
      @omniauth = OmniAuth::AuthHash.new({
        'uid' => '12345',
        'provider' => 'google_oauth2',
        'info' => OmniAuth::AuthHash::InfoHash.new('email' => 'test@lclark.edu')
      })
      @user =  instance_double('User',
                               :uid => '12345',
                               :provider => 'google_oauth2',
                               :email => 'test@lclark.edu')
      request.env['omniauth.auth'] = @omniauth
    end

    it 'should reject email address that are not lclark' do
      request.env['omniauth.auth']['info']['email'] = 'test@gmail.com'
      post :google_oauth2
      expect(response).to redirect_to('/')
    end

    it 'should call from_omniauth method and sign_in_and_redirect' do
      expect(User).to receive(:from_omniauth).with(request.env['omniauth.auth']).and_return(@user)
      expect(subject).to receive(:sign_in_and_redirect).with(@user)
      post :google_oauth2
    end

  end

end
