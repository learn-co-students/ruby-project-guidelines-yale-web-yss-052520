require_relative '../config/environment'

def run
    Seeder.clear
    load_data
    user_console
end

def load_data
    puts "Welcome to the COVID-19 Database!"
    puts "To start, let's load a country's data."

    country_prompt
    add_additional_countries

    puts "All data loaded! Launching user console..."
end

def user_console
    puts "You will now form a query."

    result = date_prompt
    case_prompt(result)

    # display_results
    # final_options
        # Export
            # Raw Data
            # Formatted Data
            # Graph
        # Create new query
        # Exit
end

###

def country_options
    country_list_data = GetRequester.get_data(Request.countries_list)

    country_list_data.each_with_object({}) do |name_info, hash|
        hash[name_info["Country"]] = name_info["Slug"]
    end
end

def country_prompt
    country_slug = $prompt.select('Choose your country! Type to filter', country_options, filter: true)

    puts "Loading data..."
    seed_database(country_slug)
    puts "Done!"
end

def add_additional_countries
    while selection = $prompt.select("Would you load another country's data?", ['Add another country', 'Next'])
        case selection
        when 'Add another country'
            country_prompt
        when 'Next'
            break
        end
    end
end

def date_prompt
    result = []
    selection = $prompt.select('Would you like to search by a date or a range of dates?', {'Date' => 0, 'Range of dates' => 1})

    case selection
    when 0
        search_date = $prompt.ask("Provide a date (DD/MM):")

        date_array = search_date.split('/')
        puts "Your date is #{date_array[0]}/#{date_array[1]}/2020"
        result = search_date(date_array)
    when 1
        puts "work in progess!"
    end
    result
end

def case_prompt(result)
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

###

def seed_database(country_slug)
    country_url = Request.country_url(country_slug)
    country_data = GetRequester.get_data(country_url)
    Seeder.seed(country_data)
end

def search_date(date_array)
    date = "2020-#{date_array[1]}-#{date_array[0]} 00:00:00 UTC"
    # "Date": "2020-02-26 00:00:00 UTC"
    Day.all.select{|element| element["date"] == date}
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

