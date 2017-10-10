require 'rails_helper'

describe IndexManagerController do

  describe 'destroy layer' do

    def login_admin
      @request.env["devise.mapping"] = Devise.mappings[:admin]
      sign_in FactoryGirl.create(:admin)
    end

    def login_user
      @request.env["devise.mapping"] = Devise.mappings[:user]
      user = FactoryGirl.create(:user)
      sign_in user
    end

    it 'should not delete layer if a user is not logged in' do
      get :destroy, params: { id: 'stanford-cg357zz0321'}
      solr = Blacklight.default_index.connection
      res = solr.get 'get', :params => { :id => 'stanford-cg357zz0321' }
      expect(res["doc"]).to_not be_nil
      expect(response).to redirect_to(root_path)
    end

    it 'should not delete layer if a user is not admin' do
      login_user
      get :destroy, params: { id: 'stanford-cg357zz0321'}
      solr = Blacklight.default_index.connection
      res = solr.get 'get', :params => { :id => 'stanford-cg357zz0321' }
      expect(res["doc"]).to_not be_nil
      expect(response).to redirect_to(root_path)
    end

    it 'should not delete a layer if layer is not found' do
      login_admin
      get :destroy, params: { id: 'yolo'}
      solr = Blacklight.default_index.connection
      res = solr.get 'get', :params => { :id => 'yolo' }
      expect(res["doc"]).to be_nil
      expect(response).to redirect_to(root_path)
    end

    it 'should delete a layer if user is admin and layer is found' do
      login_admin
      get :destroy, params: { id: 'stanford-cg357zz0321'}
      solr = Blacklight.default_index.connection
      res = solr.get 'get', :params => { :id => 'stanford-cg357zz0321' }
      expect(res["doc"]).to be_nil
      expect(response).to redirect_to(root_path)
    end

  end

end
