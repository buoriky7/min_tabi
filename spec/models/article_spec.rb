require 'rails_helper'

RSpec.describe Article, type: :model do
  before do
    @user = User.create(email: "1@email.com", password: "password", password_confirmation: "password", last_name: "last_name", first_name: "first_name", nickname: "nickname", admin_flg: false)
    @timeline = Timeline.create(user_id: @user.id, title: "title", post_flag: 0)
    @place = Place.create(user_id: @user.id, address: "address")
  end
  context "データが正しく保存される" do
    it "全て入力しているので保存される" do
      article = Article.create(
        article_image_id: "article_image_id",
        caption: "caption",
        body: "article.body",
        star: 3,
        user_id: @user.id,
        timeline_id: @timeline.id,
        place_id: @place.id
        )
      expect(article).to be_valid
    end
    it "画像がなくても保存される" do
      article = Article.create(
        article_image_id: "",
        caption: "caption",
        body: "article.body",
        star: 3,
        user_id: @user.id,
        timeline_id: @timeline.id,
        place_id: @place.id
        )
      expect(article).to be_valid
    end
    it "starがなくても保存される" do
      article = Article.create(
        article_image_id: "article_image_id",
        caption: "caption",
        body: "article.body",
        star: "",
        user_id: @user.id,
        timeline_id: @timeline.id,
        place_id: @place.id
        )
      expect(article).to be_valid
    end
  end

  context "データが保存されない" do
    it "captionがないので保存されない" do
      article = Article.create(
        article_image_id: "article_image_id",
        caption: "",
        body: "article.body",
        star: 3,
        user_id: @user.id,
        timeline_id: @timeline.id,
        place_id: @place.id
        )
      expect(article).to be_invalid
    end
    it "bodyがないので保存されない" do
      article = Article.create(
        article_image_id: "article_image_id",
        caption: "caption",
        body: "",
        star: 3,
        user_id: @user.id,
        timeline_id: @timeline.id,
        place_id: @place.id
        )
      expect(article).to be_invalid
    end
  end
end
