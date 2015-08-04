require 'rails_helper'

describe Api::SpotsController do
  let(:current_skater_mock) { double('mock_current_skater', id: 1) }

  before do
    allow(controller).to receive(:current_skater).and_return(current_skater_mock)
  end

  describe '#create' do
    let(:params) { { spot: { name: 'Test Spot', lat: 12343, long: 34346456 } } }
    let(:make_request) { post :create, params }

    let(:mock_spot) do
      double('mock_spot', id: 2, skater_id: 2, lat: 2342354, long: 76567, name: 'Test Spot').tap do |spot|
        allow(spot).to receive(:read_attribute_for_serialization) { |name| spot.send(name) }
      end
    end

    before do
      allow(Spot).to receive(:create!).and_return(mock_spot)
    end

    it 'should call Spot.create! with args' do
      expect(Spot).to receive(:create!).with({"lat"=>"12343", "long"=>"34346456", "name"=>"Test Spot", "skater_id"=>1})
      make_request
    end

    it 'should return create spot' do
      make_request
      expect(response_body).to eq({ spot: { id: 2, skater_id: 2, name: 'Test Spot', lat: 2342354, long: 76567 }})
    end

    describe 'when the response is successful' do
      it 'should have http_response_code(200)' do
        make_request
        expect(response).to have_http_status(200)
      end
    end
  end
end

