require 'json'
require 'faraday'

require 'strava/version'
require 'strava/configuration'
require 'strava/entities/entity'
require 'strava/entities/segment'
require 'strava/entities/stream'
require 'strava/request'
require 'strava/segments'
require 'strava/streams'

module Strava
  class << self
    def configure
      yield(configuration)
    end

    def configuration
      @configuration ||= Configuration.new
    end

    def reset
      configuration.reset
    end
  end
end
