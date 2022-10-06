require 'rails_helper'
RSpec.describe 'Posts', type: :request do
  context 'when GET /index' do
    let!(:user) { User.create(name: 'Darwin', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.', posts_counter: 0) }
    before(:example) do
      get user_posts_path(user)
    end

    it 'should have success code of ok' do
      expect(response).to have_http_status(:ok)
    end

    it "should render the 'index' template" do
      expect(response).to render_template(:index)
    end
  end
  context 'when GET /show' do
    let!(:user) { User.create(name: 'Darwin', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.') }
    let!(:post) { Post.create(author: user, title: 'Hello', text: 'This is my first post') }
    before(:each) do
      get user_post_path(user, post)
    end

    it 'should have success code of ok' do
      expect(response).to have_http_status(:ok)
    end

    it "should render the 'show' template" do
      expect(response).to render_template(:show)
    end
  end
end
