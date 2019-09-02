require 'rails_helper'

RSpec.describe HomeController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #login_or_register" do
    context "When user is existed" do
      let(:user) { create(:user) }

      context "When password is correct" do
        it "redirect to root path" do
          post :login_or_register, params: {username: user.username, password: 'password'}
          expect(response).to redirect_to(root_path)
        end
      end

      context "When password is incorrect" do
        it "redirect to root path with flash message" do
          post :login_or_register, params: {username: user.username, password: 'incorrect_password'}
          expect(response).to redirect_to(root_path)
          expect(flash[:error]).to be_present
        end
      end
    end

    context "When user is not existed" do
      context "When password is correct" do
        it "create new user and redirect to root path" do
          post :login_or_register, params: {username: 'remitano-test', password: 'password'}
          expect(response).to redirect_to(root_path)
          expect(User.count).to eq(1)
          expect(User.first.username).to eq('remitano-test')
        end
      end
    end
  end
end
