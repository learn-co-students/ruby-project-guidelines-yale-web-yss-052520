require_relative '../config/environment'
$prompt = TTY::Prompt.new

def available_countries
    GetRequester.new("https://api.covid19api.com/countries").parse_json
end

def country_prompt
    available_countries_names = available_countries.map {|country| country["Country"]}
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

    while selection = $prompt.select('Select a query!', ['Add another country', 'Next'])

        case selection
        when 'Add another country'
            country_prompt
        when 'Next'
            break
        end
    end

    result = []
    while selection = $prompt.select('Select a query!', ['Search by a date', 'Search by range of dates', 'Next'])
        case selection
        when 'Search by a date'
            puts "Input your date format: DD/MM"
            date_array = gets.chomp.split('/')
            puts "Your date is #{date_array[0]}/#{date_array[1]}/2020"
            result = search_date(date_array)
        when 'Next'
            break
        else
            'work in progress'
        end
    end
    
    while selection = $prompt.select('Search by ...', ['active cases', 'confirmed cases', 'death_cases','all cases', 'exit'])

        case selection
        when 'all cases'
            pp result
        when 'active cases'
            pp result.map {|element| element["active_cases"]}
        when 'exit'
            break
        else
            'work in progress'
        end
    end
end

def search_date(date_array)
    date = "2020-#{date_array[1]}-#{date_array[0]} 00:00:00 UTC"
    # "Date": "2020-02-26 00:00:00 UTC"
    Day.all.select{|element| element["date"] == date}
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

