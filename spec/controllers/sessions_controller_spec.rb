require 'rails_helper'

RSpec.describe SessionsController, type: :controller do

  before(:each) do
    User.destroy_all
  end

  let(:gh_user) {User.create(:username => "Jane_Doe", :email => "janed@anon.co", :password => "password", :provider => "github", :uid => 1234567)}

  let(:tw_user) {User.create(:username => "joe_schmo", :email => "jsch@anon.co", :password => "password", :provider => "twitter", :uid => 7654321)}

  describe 'get create' do
    it 'finds user from github if it exists and logs the user in' do
      auth = {
        :provider => 'github',
        :uid => gh_user.uid,
        :info => {
          :email => 'janed@anon.co',
          :nickname => gh_user.username
        }
      }
      auth = ActiveSupport::HashWithIndifferentAccess.new(auth)
      @request.env['omniauth.auth'] = auth
      get :create
      expect(@request.session[:user_id]).to eq(gh_user.id)
    end

    it 'finds user from twitter if it exists and logs the user in' do
      auth = {
        :provider => 'twitter',
        :uid => tw_user.uid,
        :info => {
          :email => 'jsch@anon.co',
          :nickname => tw_user.username
        }
      }
      auth = ActiveSupport::HashWithIndifferentAccess.new(auth)
      @request.env['omniauth.auth'] = auth
      get :create
      expect(@request.session[:user_id]).to eq(tw_user.id)
    end

    it 'creates user if it doesnt exist in the db' do
      auth = {
        :provider => 'github',
        :uid => '1234567',
        :info => {
          :email => 'janed@anon.co',
          :nickname => 'Jane_Doe'
        }
      }
      auth = ActiveSupport::HashWithIndifferentAccess.new(auth)
      @request.env['omniauth.auth'] = auth
      get :create
      expect(@request.session[:user_id]).to eq(1)
    end

    it "create the user correctly" do
      username = 'joe_schmo'
      auth = {
        :provider => 'twitter',
        :uid => 7654321,
        :info => {
          :email => 'jsch@anon.co',
          :nickname => username
        }
      }
      auth = ActiveSupport::HashWithIndifferentAccess.new(auth)
      @request.env['omniauth.auth'] = auth
      get :create
      create_user = User.first
      expect(create_user.username).to eq(username)
    end
  end
end
