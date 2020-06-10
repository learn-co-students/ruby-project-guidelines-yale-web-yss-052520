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
    add_additional_countries_prompt

    puts "Data loaded! Launching user console..."
end

def user_console
    puts "Now, form a query."

    query_prompt

    while selection = $prompt.select('What would you like to do next?', {"Form a new query": 0, "Export data": 1, "Quit": 2})
        case selection
        when 0
            query_prompt
        when 1
            export_prompt
        when 2
            break
        end
    end
end

def query_prompt
    Query.destroy_all
    query = Query.new

    date_prompt
    case_prompt

    query.print
end

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

def add_additional_countries_prompt
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
    query = Query.all.first
    selection = $prompt.select('Would you like to search by a date or a range of dates?', {'Date' => 0, 'Range of dates' => 1})

    case selection
    when 0
        date = $prompt.ask("Provide a date (DD/MM):") {|q| q.validate(/[0-9][0-9]\/[0-9][0-9]/,'Please format as DD/MM')}

        query.date_type = "single"
        date_array = Query.create_date_array(date)
        query.single_date = date_array
    when 1
        starting_date = $prompt.ask("Provide a starting date (DD/MM):") {|q| q.validate(/[0-9][0-9]\/[0-9][0-9]/, 'Please format as DD/MM')}
        ending_date = $prompt.ask("Provide a ending date (DD/MM):") {|q| q.validate(/[0-9][0-9]\/[0-9][0-9]/, 'Please format as DD/MM')}

        query.date_type = "range"
        starting_date_array = Query.create_date_array(starting_date)
        ending_date_array = Query.create_date_array(ending_date)

        query.starting_date = starting_date_array
        query.ending_date = ending_date_array
    end
end

def case_prompt
    query = Query.all.first
    query.case_type = $prompt.select('Select a case type.', {'Confirmed' => 'confirmed_cases', 'Active' => 'active_cases', 'Deaths' => 'death_cases', 'Recovered' => 'recovered_cases'}) 
end

def export_prompt
    selection = $prompt.select('How would you like to export your data?', {"Raw data": 0, "Formatted data": 1, "Graph": 2, "Go back": 3})
    
    case selection
    when 0
        # Raw data (.json? .db?)
    when 1
        # Formatted data (.txt)
    when 2
        # Graph
    end
end

def seed_database(country_slug)
    country_url = Request.country_url(country_slug)
    country_data = GetRequester.get_data(country_url)
    Seeder.seed(country_data)
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

