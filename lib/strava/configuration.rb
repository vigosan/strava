module Strava
  class Configuration
    HOST = 'https://www.strava.com/api/v3'

    attr_accessor :access_token
    attr_reader :host

    def initialize
      @host = HOST
    end

    def reset
      @access_token = nil
    end
  end
end
