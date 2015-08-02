require 'rails_helper'

describe Api::PostsController do
  let(:current_skater_mock) { double('mock_current_skater', id: 1) }

  before do
    allow(controller).to receive(:current_skater).and_return(current_skater_mock)
  end

  describe '#index' do
    let(:make_request) { get :index }

    before do
      allow(Post).to receive(:find_by)
    end

    it 'should call Post.find_by with args' do
      expect(Post).to receive(:find_by).with({ skater_id: current_skater_mock.id })
      make_request
    end
  end

  describe '#create' do
    let(:make_request) { post :create, params }
    let(:params) {{ post: { caption: 'test' } }}
    let(:mock_post) { double('mock_post') }

    before do
      allow(Post).to receive(:create!).and_return(mock_post)
    end

    it 'should call Post.create! with args' do
      expect(Post).to receive(:create!).with({ caption: 'test', skater_id: 1 })
      make_request
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
    let(:mock_post) { double('mock_post') }

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

    describe 'when the response is successful' do
      it 'should have http_response_code(200)' do
        make_request
        expect(response).to have_http_status(200)
      end
    end
  end
end