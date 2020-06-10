class GetRequester
    def initialize(url)
        @url = url
    end

    def get_response_body
        uri = URI.parse(@url)
        response = Net::HTTP.get_response(uri)
        response.body
    end

    def parse_json
        json = JSON.parse(self.get_response_body)
    end

    def self.get_data(url)
        request = GetRequester.new(url)
        JSON.parse(request.get_response_body)
    end
end


