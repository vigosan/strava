module Strava
  class Request
    attr_reader :configuration

    def initialize(configuration: Strava.configuration)
      @configuration = configuration
    end

    def request(method, path, opts={})
      response = connection.send(method, path, opts)
      handle_response(response)
    end

    private

    def connection
      conn = Faraday.new
      conn.url_prefix = api_url
      conn
    end

    def handle_response(response)
      return parse_response(response) if response.success?
      handle_error_response(response)
    end

    def parse_response(response)
      JSON.parse(response.body)
    end

    def handle_error_response(response)
    end

    def api_url
      "#{configuration.host}?access_token=#{configuration.access_token}"
    end

    def build_query(params)
      URI.escape(params.collect{ |k,v| "#{k}=#{v}" }.join('&'))
    end
  end
end
