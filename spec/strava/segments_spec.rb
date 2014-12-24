require 'spec_helper'

module Strava
  describe Segments do
    before { Strava.configure { |c| c.access_token = 'TOKEN' } }

    describe 'starred' do
      it 'returns segments starred by the authenticated user' do
        url = 'https://www.strava.com/api/v3/segments/starred?access_token=TOKEN'
        response = [
          {
            'id' => 3506498,
            'resource_state' => 2,
            'name' => 'Imposible Pinet',
            'activity_type' => 'Ride',
            'distance' => 2620.34,
            'average_grade' => -5,
            'maximum_grade' => 49.9,
            'elevation_high' => 520,
            'elevation_low' => 347.6,
            'start_latlng' => [
              38.97221764,
              -0.35193442
            ],
            'end_latlng' => [
              38.98452241,
              -0.34150178
            ],
            'start_latitude' => 38.97221764,
            'start_longitude' => -0.35193442,
            'end_latitude' => 38.98452241,
            'end_longitude' => -0.34150178,
            'climb_category' => 0,
            'city' => 'Pinet',
            'state' => 'Valencian Community',
            'country' => 'Spain',
            'private' => false,
            'starred' => true,
            'pr_time' => 762,
            'athlete_pr_effort' => {
              'id' => 3350889046,
              'elapsed_time' => 762,
              'distance' => 2416.9,
              'start_date' => '2013-08-31T08:28:05Z',
              'start_date_local' => '2013-08-31T10:28:05Z',
              'is_kom' => false
            },
            'starred_date' => '2014-09-06T11:49:17Z'
          }
        ]

        body = JSON.dump(response)
        headers = { 'Content-Type' => 'application/json' }

        stub_request(:get, url).
          to_return(status: 200, body: body, headers: headers)

        segments = Segments.new.starred
        segment = segments.first

        expect(segment.name).to eq('Imposible Pinet')
        expect(segment.athlete_pr_effort.is_kom).to be(false)
      end
    end

    describe 'streams' do
      it 'returns the raw data of the segment' do
        url = 'https://www.strava.com/api/v3/segments/3506498/latlong?access_token=TOKEN&resolution=low&series_type=distance'
        response = [
          {
            'type' => 'latlng',
            'data' => [[38.971849, -0.488013], [38.971892, -0.488023]],
            'series_type' => 'distance',
            'original_size' => 5,
            'resolution' => 'low'
          },
          {
            'type' => 'distance',
            'data' => [0, 4.8],
            'series_type' => 'distance',
            'original_size' => 5,
            'resolution' => 'low'
          }
        ]

        body = JSON.dump(response)
        headers = { 'Content-Type' => 'application/json' }

        stub_request(:get, url).
          to_return(status: 200, body: body, headers: headers)

        streams = Segments.new.streams(3506498, resolution: 'low', series_type: 'distance')
        stream = streams.first

        expect(stream.type).to eq('latlng')
        expect(stream.original_size).to eq(5)
      end
    end
  end
end
