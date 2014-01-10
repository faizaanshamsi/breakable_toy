require 'spec_helper'
# Use Carrierwave's provided test matchers
require 'carrierwave/test/matchers'

describe ProfilePictureUploader do
  include CarrierWave::Test::Matchers

  let(:uploader) do
    ProfilePictureUploader.new(FactoryGirl.build(:user),
      :profile_picture)
  end

  let(:path) do
    Rails.root.join('spec/file_fixtures/profile.jpg')
  end

  before do
    ProfilePictureUploader.enable_processing = true
  end

  after do
    ProfilePictureUploader.enable_processing = false
  end

  it 'stores without error' do
    expect(lambda { uploader.store!(File.open(path)) }).to_not raise_error
  end
end
