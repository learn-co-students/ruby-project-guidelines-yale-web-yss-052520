class Request
    attr_accessor :api, :location, :start_date, :end_date, :case_type

    def initialize(args)
        @api = args[:api]
        @location = args[:location]
        @start_date = args[:start_date]
        @end_date = args[:end_date]
        @case_type = args[:case_type]
    end

    def generate_url(country_slug, start_date, end_date)
        'https://api.covid19api.com/country/' + country_slug
    end
end

#DateTime.new(year, month, day, hour, min, seconds, offset)

# input start_date: MM/DD