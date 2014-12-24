module Strava
  module Entities
    class Segment < Entity
      ATTRIBUTES = [:id, :resource_state, :name, :activity_type, :distance, :average_grade, :maximum_grade, :elevation_high, :elevation_low, :start_latlng, :end_latlng, :start_latitude, :start_longitude, :end_latitude, :end_longitude, :climb_category, :city, :state, :country, :private, :starred, :pr_time, :athlete_pr_effort, :starred_date]
    end
  end
end
