require 'spec_helper'

describe Strava do
  describe '.configure' do
    it 'sets the configuration' do
      access_token = 'TOKEN'
      Strava.configure { |c| c.access_token = access_token }

      expect(Strava.configuration.access_token).to eq(access_token)
    end
  end

  describe '.reset' do
    it 'resets the configuration' do
      expect(Strava.configuration).to receive(:reset).once

      Strava.reset
    end
  end
end

