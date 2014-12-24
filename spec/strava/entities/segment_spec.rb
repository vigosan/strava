require 'spec_helper'

module Strava
  module Entities
    describe Segment do
      describe '#streams' do
        let(:segment_id) { 1 }
        let(:streams) { double(:streams) }

        before do
          allow(Strava::Segments).to receive_message_chain(:new, :streams).
            with(segment_id: segment_id).
            and_return(streams)
          allow(Strava::Streams).to receive(:new).with(streams).
            and_return(streams)
        end

        it 'return streams for a given segment ' do
          segment = Segment.new(id: segment_id)

          expect(segment.streams).to eq(streams)
        end
      end
    end
  end
end
