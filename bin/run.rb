require_relative '../config/environment'

# Things finished tonight:
# Graph (support multiple country comparison) and Txt exports
# Multiple countries output (support both graph export and txt export)
# Record case types in graph and text outputs
# Added 'Quit' option for some $prompt.select
# Added "Increment" option to both graph and text outputs

# Edge cases:
# Check whether the API has the country data
# Date entered is later than the current date 
# Starting date must be earlier than the ending date

# Question:
# Do we need to keep track of multiple queries? Each query already supports multiple countries and time durations.

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

    while selection = $prompt.select('What would you like to do next?', {"Form a new query": 0, "Export data": 1, "Export data - increments": 2, "Quit": 3})
        case selection
        when 0
            query_prompt
        when 1
            export_prompt
        when 2
            data =  increment(Query.all.first.return)
            pp data
            export_prompt(data)
        when 3
            break
        end
    end
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
    
end

def add_additional_countries_prompt
    while selection = $prompt.select("Would you load another country's data?", ['Add another country', 'Next', 'Quit'])
        case selection
        when 'Add another country'
            country_prompt
        when 'Next'
            break
        when 'Quit'
            exit
        end
    end
end

def query_prompt
    Query.destroy_all
    query = Query.new

    date_prompt
    case_prompt

    pp query.return
end

def date_prompt
    query = Query.all.first
    selection = $prompt.select('Would you like to search by a date or a range of dates?', {'Date' => 0, 'Range of dates' => 1, 'Exit' => 2})

    case selection
    when 0
        date = $prompt.ask("Provide a date (DD/MM):") {|q| q.validate(/[0-9][0-9]\/[0-9][0-9]/,'Please format as DD/MM')}
        if check_date(date) == false
            puts "Selected date cannot be earlier than the current date!"
            date_prompt
            return 0
        end
        query.date_type = "single"
        date_array = Query.create_date_array(date)
        query.single_date = date_array
    when 1
        starting_date = $prompt.ask("Provide a starting date (DD/MM):") {|q| q.validate(/[0-9][0-9]\/[0-9][0-9]/, 'Please format as DD/MM')}
        ending_date = $prompt.ask("Provide a ending date (DD/MM):") {|q| q.validate(/[0-9][0-9]\/[0-9][0-9]/, 'Please format as DD/MM')}
        if check_date(starting_date) == false || check_date(ending_date) == false
            puts "Selected date cannot be earlier than the current date!"
            date_prompt
            return 0
        end
        if check_date(starting_date, ending_date) == false
            puts "Starting date must be earlier than ending_date!"
            date_prompt
            return 0
        end
        query.date_type = "range"
        starting_date_array = Query.create_date_array(starting_date)
        ending_date_array = Query.create_date_array(ending_date)

        query.starting_date = starting_date_array
        query.ending_date = ending_date_array
    when 2
        exit
    end
end

def case_prompt
    query = Query.all.first
    query.case_type = $prompt.select('Select a case type.', {'Confirmed' => 'confirmed_cases', 'Active' => 'active_cases', 'Deaths' => 'death_cases', 'Recovered' => 'recovered_cases'}) 
end

def export_prompt(data = Query.all.first.return)
    selection = $prompt.select('How would you like to export your data?', {"Formatted data": 1, "Graph": 2, "Go back": 3, "Quit": 4})
    
    # I deleted raw data option, we can add that back if we have time
    case selection
    when 1
        Exporter.export_txt(data)
    when 2
        Exporter.graph(data)
    when 4
        exit
    end
end

def seed_database(country_slug)
    country_url = Request.country_url(country_slug)
    country_data = GetRequester.get_data(country_url)
    if country_data == []
        puts "API does not support the current country!"
    else
        Seeder.seed(country_data)
        puts "Done!"
    end
end

def search_date(date_array)
    date = "2020-#{date_array[1]}-#{date_array[0]} 00:00:00 UTC"
    # "Date": "2020-02-26 00:00:00 UTC"
    Day.all.select{|element| element["date"] == date}
end

def check_date(date1, date2 = Time.now.strftime("%d/%m/%Y %H:%M"))

    # time_now = Time.now.strftime("%d/%m/%Y %H:%M")
    #=> "14/09/2011 14:09"
    # date => DD/MM
    if date2[3..4].to_i > date1[3..4].to_i
        return true
    elsif date2[3..4].to_i == date1[3..4].to_i
        if date2[0..1].to_i > date1[0..1].to_i + 2
            return true
        else
            return false
        end
    else 
        return false
    end
end

def increment(input)

    prev = input[0][2]
    output = []
    input.each do |arr|
        output << [arr[0], arr[1], arr[2] - prev]
        prev = arr[2]
    end
    output
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

