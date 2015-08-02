require 'rails_helper'

describe Api::PostsController do
  let(:current_skater_mock) { double('mock_current_skater', id: 1) }

  before do
    allow(controller).to receive(:current_skater).and_return(current_skater_mock)
  end

  let(:mock_post) do
    double('mock_post', id: 2, skater_id: 1, caption: 'test caption', lat: 123434, long: 12343452354, file_path: 'path/to/file', url: 'fake.url.com', up_vote_count: 23, down_vote_count: 87).tap do |post|
      allow(post).to receive(:read_attribute_for_serialization) { |name| post.send(name) }
    end
  end

  describe '#index' do
    let(:make_request) { get :index }

    let(:mock_posts) { [mock_post] }

    before do
      allow(Post).to receive(:find_by).and_return(mock_posts)
    end

    it 'should call Post.find_by with args' do
      expect(Post).to receive(:find_by).with({ skater_id: current_skater_mock.id })
      make_request
    end

    it 'should return posts' do
      make_request
      expect(response_body).to eq({posts:[{id:2, caption:'test caption', lat:123434, long:12343452354, file_path:'path/to/file', url:'fake.url.com', skater_id:1, up_vote_count:23, down_vote_count:87}]})
    end
  end

  describe '#create' do
    let(:make_request) { post :create, params }
    let(:params) {{ post: { caption: 'test' } }}

    before do
      allow(Post).to receive(:create!).and_return(mock_post)
    end

    it 'should call Post.create! with args' do
      expect(Post).to receive(:create!).with({ caption: 'test' })
      make_request
    end

    it 'should return the created post' do
      make_request
      expect(response_body).to eq({post:{id:2, caption:'test caption', lat:123434, long:12343452354, file_path:'path/to/file', url:'fake.url.com', skater_id:1, up_vote_count:23, down_vote_count:87}})
    end

    describe 'when the response is successful' do
      it 'should have http_response_code(200)' do
        make_request
        expect(response).to have_http_status(200)
      end
    end
  end

  describe '#update' do
    let(:make_request) { put :update, params }
    let(:params) {{ id: 1, post: { caption: 'test' } }}

    before do
      allow(Post).to receive(:find).and_return(mock_post)
      allow(mock_post).to receive(:update_attributes!)
    end

    it 'should call Post.find with args' do
      expect(Post).to receive(:find).with('1')
      make_request
    end

    it 'should call post.update_attributes!' do
      expect(mock_post).to receive(:update_attributes!).with({ caption: 'test' })
      make_request
    end

    it 'should return the updated post' do
      make_request
      expect(response_body).to eq({post:{id:2, caption:'test caption', lat:123434, long:12343452354, file_path:'path/to/file', url:'fake.url.com', skater_id:1, up_vote_count:23, down_vote_count:87}})
    end

    describe 'when the response is successful' do
      it 'should have http_response_code(200)' do
        make_request
        expect(response).to have_http_status(200)
      end
    end
  end
end