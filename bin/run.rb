require_relative '../config/environment'

$prompt = TTY::Prompt.new

def generate_request
    api_choice = $prompt.select("Global or national?", %w(global national))
    locations = $prompt.select("Select a location.", )

    # Request.new
end

# generate_request

def country_prompt
    countries =  country_list.map {|country| country["Country"]}
    country_name = $prompt.select('Choose your country! Or press key to filter', countries, filter: true)
    country_choice = country_list.find {|country| country["Country"] == country_name}["Slug"]
    country_cases(country_choice)
end

def country_list
    country_url = "https://api.covid19api.com/countries"
    country_file = GetRequester.new(country_url).parse_json
    # countries = country_file.map{|element| element["Slug"] }
    # binding.pry
end

def country_cases(country_name)
    # Sample url = https://api.covid19api.com/total/country/south-africa
    country_url = "https://api.covid19api.com/total/country/" + country_name

    country_info = GetRequester.new(country_url).parse_json

    seed_data(country_info, country_name)

end

def seed_data(country_info, country_name)

    Country.destroy_all
    Day.destroy_all
    Country.reset_pk_sequence
    Day.reset_pk_sequence

    country1 = Country.create(name: country_name)

    country_info.each do |date_info|
        Day.create(date: date_info["Date"], country_id: country1.id, confirmed_cases: date_info["Confirmed"], active_cases: date_info["Active"], death_cases: date_info["Deaths"], recovered_cases: date_info["Recovered"])
    end


end

country_prompt


def state_cases 
    p "what is your state code"
    state_code = gets.chomp

    # Sample state_url: "https://covidtracking.com/api/v1/states/ct/current.json"

    state_url = "https://covidtracking.com/api/v1/states/" + state_code.downcase + "/current.json"

    state_info = GetRequester.new(state_url).parse_json
    state_positive = state_info["positive"]
    state_death = state_info["death"]

    p "state code: " + state_code
    p "positive cases: " + state_positive.to_s + ", death cases: " + state_death.to_s
end

