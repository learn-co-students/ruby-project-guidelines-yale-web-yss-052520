require_relative '../config/environment'

$prompt = TTY::Prompt.new

def country_list
    country_url = "https://api.covid19api.com/countries"
    country_file = GetRequester.new(country_url).parse_json
    countries = country_file.map{|element| element["Slug"] }
    p countries
end

Pry.start

def country_prompt

    p "What is your country"
    
    countries =  %w(south-africa switzerland malaysia qatar denmark)
    country_name = $prompt.select('Choose your country! Or press key to filter', countries, filter: true)
    country_cases (country_name)
end

def country_cases(country_name)


    # Sample url = https://api.covid19api.com/total/country/south-africa
    country_url = "https://api.covid19api.com/total/country/" + country_name

    country_info = GetRequester.new(country_url).parse_json
    country_info_latest = country_info.last

    pp country_info_latest
  
end



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

