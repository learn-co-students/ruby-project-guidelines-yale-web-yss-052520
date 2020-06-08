require_relative '../config/environment'
require 'tty-prompt' 

p "what is your state code"
state_code = gets.chomp

# Sample state_url: "https://covidtracking.com/api/v1/states/ct/current.json"

state_url = "https://covidtracking.com/api/v1/states/" + state_code.downcase + "/current.json"

state_info = GetRequester.new(state_url).parse_json
state_positive = state_info["positive"]
state_death = state_info["death"]

p "state code: " + state_code
p "positive cases: " + state_positive.to_s + ", death cases: " + state_death.to_s


