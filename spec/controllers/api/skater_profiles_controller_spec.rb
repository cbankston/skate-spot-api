require 'rails_helper'

describe Api::SkaterProfilesController do
  let(:current_skater_mock) { double('mock_current_skater', id: 1) }

  let(:mock_skater_profile) do
    double('mock_skater_profile', id: 1, skater_id: 1, first_name: 'Logan', last_name: 'Fisher', avatar_file_path: 'path/to/file').tap do |profile|
      allow(profile).to receive(:read_attribute_for_serialization) { |name| profile.send(name) }
    end
  end

  before do
    allow(controller).to receive(:current_skater).and_return(current_skater_mock)
  end

  describe '#show' do
    let(:make_request) { get :show }

    before do
      allow(SkaterProfile).to receive(:find_by).and_return(mock_skater_profile)
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

    it 'should return the skaters profile' do
      make_request
      expect(response_body).to eq({skater_profile:{id: 1, skater_id: 1, first_name: 'Logan', last_name: 'Fisher', avatar_file_path: 'path/to/file'}})
    end
  end

  describe '#create' do
    let(:params) { { profile: { first_name: 'Logan', last_name: 'Fisher', avatar_file_path: 'path/to/file' }}}
    let(:make_request) { post :create, params }

    before do
      allow(SkaterProfile).to receive(:create!).and_return(mock_skater_profile)
    end

    it 'should call SkaterProfile.new with args' do
      expect(SkaterProfile).to receive(:create!).with({ first_name: 'Logan', last_name: 'Fisher', avatar_file_path: 'path/to/file', skater_id: current_skater_mock.id })
      make_request
    end

    it 'should return the skaters profile' do
      make_request
      expect(response_body).to eq({ skater_profile:{ id: 1, skater_id: 1, first_name: 'Logan', last_name: 'Fisher', avatar_file_path: 'path/to/file' }})
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
    let(:params) {{ id: 1, profile: { first_name: 'Logan', last_name: 'Fisher', avatar_file_path: 'path/to/file' }}}

    before do
      allow(SkaterProfile).to receive(:find_by).and_return(mock_skater_profile)
      allow(mock_skater_profile).to receive(:update_attributes!)
    end

    it 'should call SkaterProfile.find_by with args' do
      expect(SkaterProfile).to receive(:find_by).with(skater_id: current_skater_mock.id)
      make_request
    end

    it 'should call profile.update_attributes!' do
      expect(mock_skater_profile).to receive(:update_attributes!).with({ first_name: 'Logan', last_name: 'Fisher', avatar_file_path: 'path/to/file' })
      make_request
    end

    describe 'when the response is successful' do
      it 'should have http_response_code(200)' do
        make_request
        expect(response).to have_http_status(200)
      end
    end

    it 'should return the skaters profile' do
      make_request
      expect(response_body).to eq({ skater_profile: { id:1, skater_id:1, first_name: 'Logan', last_name: 'Fisher', avatar_file_path: 'path/to/file'}})
    end
  end
end