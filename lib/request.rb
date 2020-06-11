# Generates urls for GetRequester

class Request
    def self.country_url(country_slug)
        # Sample url = https://api.covid19api.com/total/country/canada
        'https://api.covid19api.com/total/country/' + country_slug
    end

    def self.countries_list
        "https://api.covid19api.com/countries"
    end
end