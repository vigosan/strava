module Strava
  class Streams
    include Enumerable

    def initialize(streams)
      @streams = streams
    end

    def each(&block)
      @streams.each(&block)
    end
  end
end
