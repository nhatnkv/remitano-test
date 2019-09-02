require 'rails_helper'

RSpec.describe MovieController, type: :controller do
  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
      expect(assigns(:movie)).not_to be_nil
    end
  end

  describe "POST #create" do
    let(:user) { create(:user) }

    before do
      controller.stub(:current_user) { user }
    end

    context "When youtube url is blank" do
      it "redirect to share movie page" do
        post :create, params: {youtube_video_id: ''}
        expect(response).to redirect_to(share_movie_path)
      end
    end

    context "When youtube url is exists" do
      before do
        post :create, params: {youtube_video_id: 'c3yWsaeh0_4'}
      end

      it 'redirect to root page' do
        expect(response).to redirect_to(root_path)
      end
    end
  end
end
