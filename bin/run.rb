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
    output = case_prompt(result)

    selection = $prompt.select('Next', ["Form a graph", "Query again", "Exit"], filter: true)

    case selection
    when "Exit"
    when "Query again"
        user_console
    when "Form a graph"
        graph(output)
    end
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
        starting_date = $prompt.ask("Provide a starting date (DD/MM):")
        ending_date = $prompt.ask("Provide a ending date (DD/MM):")
        starting_date_array = starting_date.split('/')
        ending_date_array = ending_date.split('/')
        result = search_date_range(starting_date_array, ending_date_array)
    end
    result
end

def case_prompt(result)
    output = result
    while selection = $prompt.select('Search by ...', ['active cases', 'confirmed cases', 'death cases','all cases', 'next'])

        case selection
        when 'all cases'
            pp result            
        when 'next'
            break
        else
            # puts "Country is: " + result.first.country.name
            selection_arr = selection.split(' ')
            output = result.map do |element| 
                [
                element.country.name,
                element["date"],
                element[selection_arr[0] + "_" + selection_arr[1]]
                ]
            end
            pp output
        end
    end
    output
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

def search_date_range(starting_date_array, ending_date_array)
    starting_date = "2020-#{starting_date_array[1]}-#{starting_date_array[0]} 00:00:00 UTC"
    ending_date = "2020-#{ending_date_array[1]}-#{ending_date_array[0]} 00:00:00 UTC"
    result = []
    starting_triggered = false
    Day.all.each do |element|
        if element["date"] == starting_date
            starting_triggered = true
        end
        if starting_triggered == true
            result << element
        end
        if element["date"] == ending_date
            break
        end
    end
    result
end

def graph
    graph1 = Scruffy::Graph.new
    graph1.add(:line, 'US', [100, -20, 30, 60])
    graph1.render
    # output.each do |entry|
    #     entry[1]
end

# run
graph

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

