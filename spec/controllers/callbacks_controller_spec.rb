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
                               :admin => false,
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
      expect(subject).to receive(:set_user_role).with(@user)
      expect(subject).to receive(:sign_in_and_redirect).with(@user)
      post :google_oauth2
    end

    it 'should give admin attribute if a user is admin' do
      expect(File).to receive(:read).and_return("test@lclark.edu\ntest2@lclark.edu")
      expect(@user).to receive(:update_attribute).with(:admin, true)
      CallbacksController.new.set_user_role(@user)
    end

    it 'should revoke admin attribute if a user is not admin' do
      expect(File).to receive(:read).and_return("nouser@lclark.edu")
      expect(@user).to receive(:update_attribute).with(:admin, false)
      CallbacksController.new.set_user_role(@user)
    end

  end

end
