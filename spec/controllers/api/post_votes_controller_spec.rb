require 'rails_helper'

describe Api::PostVotesController do
  let(:current_skater_mock) { double('mock_current_skater', id: 1) }

  before do
    allow(controller).to receive(:current_skater).and_return(current_skater_mock)
  end

  describe '#create' do
    let(:params) { { vote: { post_id: 3, direction: 'up' } } }
    let(:make_request) { post :create, params }
    let(:mock_vote) { double('mock_vote') }

    before do
      allow(PostVote).to receive(:create!).and_return(mock_vote)
    end

    it 'should call PostVote.create! with args' do
      expect(PostVote).to receive(:create!).with({"post_id"=>"3", "direction"=>"up", "skater_id"=>current_skater_mock.id})
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
