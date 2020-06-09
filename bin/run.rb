# require_relative '../config/environment'
require 'net/http'

url = URI.parse('https://www.googleapis.com/civicinfo/v2/representatives')
req = Net::HTTP::Get.new(url.to_s)
# res = Net::HTTP.start(url.host, url.port) {|http|
#   http.request(req)
# }
pp req


puts "HELLO WORLD"

