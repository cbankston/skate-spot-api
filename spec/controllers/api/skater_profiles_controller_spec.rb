require 'rails_helper'

describe Api::SkaterProfilesController do
  let(:current_skater_mock) { double('mock_current_skater', id: 1) }

  before do
    allow(controller).to receive(:current_skater).and_return(current_skater_mock)
  end

  describe '#show' do
    let(:make_request) { get :show }

    before do
      allow(SkaterProfile).to receive(:find_by)
    end

    it 'should call SkaterProfile.find_by with args' do
      expect(SkaterProfile).to receive(:find_by).with({ skater_id: current_skater_mock.id })
      make_request
    end

    describe 'when the response is successful' do
      it 'should have http_response_code(200)' do
        make_request
        expect(response).to have_http_status(200)
      end
    end
  end

  describe '#create' do
    let(:params) { { profile: { skater_id: current_skater_mock.id, first_name: 'Logan', last_name: 'Fisher', avatar_file_path: 'path/to/file' } } }
    let(:make_request) { post :create, params }
    let(:mock_skater_profile) { double('mock_skater_profile') }

    before do
      allow(SkaterProfile).to receive(:new).and_return(mock_skater_profile)
      allow(mock_skater_profile).to receive(:save!)
    end

    it 'should call SkaterProfile.new with args' do
      expect(SkaterProfile).to receive(:new).with({"skater_id"=>"1", "first_name"=>"Logan", "last_name"=>"Fisher", "avatar_file_path"=>"path/to/file"})
      make_request
    end

    it 'should call mock_skater_profile.save! with no args' do
      expect(mock_skater_profile).to receive(:save!).with(no_args)
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
    let(:params) { { id: 1, profile: { skater_id: current_skater_mock.id, first_name: 'Logan', last_name: 'Fisher', avatar_file_path: 'path/to/file' } } }
    let(:mock_skater_profile) { double('mock_skater_profile') }

    before do
      allow(SkaterProfile).to receive(:find_by).and_return(mock_skater_profile)
      allow(mock_skater_profile).to receive(:attributes=)
      allow(mock_skater_profile).to receive(:save!)
    end

    it 'should call SkaterProfile.find_by with args' do
      expect(SkaterProfile).to receive(:find_by).with(skater_id: current_skater_mock.id)
      make_request
    end

    it 'should call profile.attributes = update_params' do
      expect(mock_skater_profile).to receive(:attributes=).with({ "first_name"=>"Logan", "last_name"=>"Fisher", "avatar_file_path"=>"path/to/file" })
      make_request
    end

    it 'should call profile.save!' do
      expect(mock_skater_profile).to receive(:save!).with(no_args)
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