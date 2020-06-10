class Request
    attr_accessor :api, :location, :start_date, :end_date, :case_type

    def initialize(args)
        @api = args[:api]
        @location = args[:location]
        @start_date = args[:start_date]
        @end_date = args[:end_date]
        @case_type = args[:case_type]
    end

    def self.country_url(country_slug)
        # Sample url = https://api.covid19api.com/total/country/canada
        'https://api.covid19api.com/total/country/' + country_slug
    end

    def self.countries_list
        "https://api.covid19api.com/countries"
    end
end