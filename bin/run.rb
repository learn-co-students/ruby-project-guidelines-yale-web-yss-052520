require_relative '../config/environment'
<<<<<<< HEAD
$prompt = TTY::Prompt.new

def country_list
    country_url = "https://api.covid19api.com/countries"
    country_file = GetRequester.new(country_url).parse_json
    countries = country_file.map{|element| element["Slug"] }
    p countries
=======

$prompt = TTY::Prompt.new

def generate_request
    api_choice = $prompt.select("Global or national?", %w(global national))
    locations = $prompt.select("Select a location.", )

    # Request.new
>>>>>>> fccded42e7fab5368fd2fffff5dd69db2777a975
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
    country_info_latest = country_info.last

    pp country_info_latest
  
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

