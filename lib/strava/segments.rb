module Strava
  class Segments < Request
    def starred
      segments_attrs = request(:get, 'segments/starred')
      build_segments(segments_attrs)
    end

    def streams(segment_id:, types: 'latlong', **opts)
      path = "segments/#{segment_id}/#{types}"
      path << "?#{build_query(opts)}" if opts.any?
      streams_attrs = request(:get, path)
      build_streams(streams_attrs)
    end

    private

    def build_segments(segments_attrs)
      segments_attrs.map do |segment_attrs|
        Entities::Segment.new(segment_attrs)
      end
    end

    def build_streams(streams_attrs)
      streams_attrs.map do |stream_attrs|
        Entities::Stream.new(stream_attrs)
      end
    end
  end
end
