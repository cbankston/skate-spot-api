require 'rails_helper'

describe Api::PostsController do
  describe '#index' do
    let(:make_request) { get :index }

    before do
      allow(Post).to receive(:all)
    end

    it 'should call Post.all' do
      expect(Post).to receive(:all).with(no_args)
      make_request
    end
  end

  describe '#create' do
    let(:make_request) { post :create, params }
    let(:params) {{ post: { title: 'test' } }}
    let(:mock_post) { double('mock_post') }

    before do
      allow(Post).to receive(:new).and_return(mock_post)
      allow(mock_post).to receive(:save!)
    end

    it 'should call Post.new with args' do
      expect(Post).to receive(:new).with({ title: 'test' })
      make_request
    end

    it 'should call mock_post.save! with no args' do
      expect(mock_post).to receive(:save!).with(no_args)
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
    let(:params) {{ id: 1, post: { title: 'test' } }}
    let(:mock_post) { double('mock_post') }

    before do
      allow(Post).to receive(:find).and_return(mock_post)
      allow(mock_post).to receive(:attributes=)
      allow(mock_post).to receive(:save!)
    end

    it 'should call Post.find with args' do
      expect(Post).to receive(:find).with('1')
      make_request
    end

    it 'should call post.attributes = update_params' do
      expect(mock_post).to receive(:attributes=).with({ title: 'test' })
      make_request
    end

    it 'should call post.save!' do
      expect(mock_post).to receive(:save!).with(no_args)
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