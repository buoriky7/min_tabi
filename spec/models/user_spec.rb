require 'rails_helper'

RSpec.describe User, type: :model do
  context "データが正しく保存される" do
    it "全て入力しているので保存される" do
      user = User.create(email: "1@email.com", password: "password", password_confirmation: "password", last_name: "last_name", first_name: "first_name", nickname: "nickname", admin_flg: false)
      expect(user).to be_valid
    end
  end
end
