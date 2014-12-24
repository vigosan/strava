# Strava

A ruby wrapper for Strava APIv3

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'strava'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install strava

## Configuration

    Strava.configure do |c|
      c.access_token = access_token
    end

## Usage

### List starred segment

    Segments.new.starred

### Retrieve segment streams

    Segments.new.streams(segment_id: 3506498, resolution: 'low', series_type: 'distance')

## Contributing

1. Fork it ( https://github.com/vigosan/strava/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
