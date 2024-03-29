require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do

  describe "GET #new" do
    context "表示ができた時" do
      before do
        get :new
      end
      it "returns http success" do
        get :new
        expect(response).to have_http_status(:success)
      end
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      get :edit
      expect(response).to have_http_status(:success)
    end
  end

end
