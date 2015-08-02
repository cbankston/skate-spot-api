require 'rails_helper'

describe Api::SpotsController do
  let(:current_skater_mock) { double('mock_current_skater', id: 1) }

  before do
    allow(controller).to receive(:current_skater).and_return(current_skater_mock)
  end

  describe '#create' do
    let(:params) { { spot: { name: 'Test Spot', lat: 12343, long: 34346456 } } }
    let(:make_request) { post :create, params }
    let(:mock_spot) { double('mock_spot') }

    before do
      allow(Spot).to receive(:create!).and_return(mock_spot)
    end

    it 'should call Spot.create! with args' do
      expect(Spot).to receive(:create!).with({"lat"=>"12343", "long"=>"34346456", "name"=>"Test Spot", "skater_id"=>current_skater_mock.id})
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

