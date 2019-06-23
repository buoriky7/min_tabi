require 'rails_helper'

RSpec.describe UsersController, type: :controller do

# RSpecの書き方の勉強に書いたテストコード（まだよくわからない）
  describe "GET #show" do
    context "user#showが正しく表示される" do
      before do
        subject {get :show, params: params}
      end
      it "リクエストが200となる" do
        expect(response.status).to eq 200
      end
    end
  end

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #edit" do
    context "user#editが正しく表示される" do
      before do
        subject {get :edit, params: params}
      end
      it "リクエストが200となる" do
        expect(response.status).to eq 200
      end
    end
  end

  describe "GET #destroy_confirm" do
    it "returns http success" do
      get :destroy_confirm
      expect(response).to have_http_status(:success)
    end
  end

end
