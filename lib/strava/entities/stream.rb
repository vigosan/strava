module Strava
  module Entities
    class Stream < Entity
      ATTRIBUTES = [:type, :data, :series_type, :original_size, :resolution]
    end
  end
end
