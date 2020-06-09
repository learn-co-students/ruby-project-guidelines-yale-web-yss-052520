require_relative '../config/environment'
$prompt = TTY::Prompt.new

def available_countries
    GetRequester.new("https://api.covid19api.com/countries").parse_json
end

def country_prompt
    available_countries_names = available_countries.map {|country| country["Country"]}.sort
    country_name = $prompt.select('Choose your country! Type to filter', available_countries_names, filter: true)

    country_slug = available_countries.find {|country| country["Country"] == country_name}["Slug"]

    seed_database(country_slug)
end

def seed_database(country_slug)
    # Sample url = https://api.covid19api.com/total/country/south-africa
    country_url = "https://api.covid19api.com/total/country/" + country_slug

    country_info = GetRequester.new(country_url).parse_json

    Seeder.seed(country_info)
end

def user_console
    puts "Welcome to the COVID-19 Database!"

    country_prompt

    queries = ['Add another country', 'Search by a date', 'Search by range of dates', 'Search by case type', 'Run search', 'Exit']
    
    selection = ''

    until selection == 'Exit'
        selection = $prompt.select('Select a query!', queries)

        case selection
        when 'Add another country'
            country_prompt
        when 'Run search'
            puts Country.all
        else
            'work in progress'
        end
    end

    puts "Goodbye for now!"
end

def run
    Seeder.clear
    user_console
end

run

# def state_cases 
#     p "what is your state code"
#     state_code = gets.chomp

    # # Sample state_url: "https://covidtracking.com/api/v1/states/ct/current.json"

#     state_url = "https://covidtracking.com/api/v1/states/" + state_code.downcase + "/current.json"

#     state_info = GetRequester.new(state_url).parse_json
#     state_positive = state_info["positive"]
#     state_death = state_info["death"]

#     p "state code: " + state_code
#     p "positive cases: " + state_positive.to_s + ", death cases: " + state_death.to_s
# end

