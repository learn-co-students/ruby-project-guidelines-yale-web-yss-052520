require_relative '../config/environment'

$ex_address = "688%20Passaic%20Avenue,%20Nutley,%20NJ%2007109"

def getOfficialsListWithAddress(address)
	address = "688%20Passaic%20Avenue,%20Nutley,%20NJ%2007109"
	api_key = "AIzaSyCb-lOzV8VGKHM495tFhMF_S_-PhmVFNc4"
	url = "https://www.googleapis.com/civicinfo/v2/representatives?address=#{address}&key=#{api_key}"
	response = HTTParty.get(url)
end

def createOfficial(officialHash, responseJson)
	name = officialHash["name"]
	address = officialHash["address"] ? officialHash["address"][0]: nil
	location = address ? "#{address["line1"]}, #{address["city"]}, #{address["state"]}, #{address["zip"]}":nil
	email = officialHash["emails"]? officialHash["emails"][0]:nil
	officialIndex = responseJson["officials"].find_index(officialHash)
	role = responseJson["offices"].find{ |office| 
		office["officialIndices"].include?(officialIndex)
	}["name"]

	Official.create(name: name, location: location, email: email, role: role)
end 

def createAllOfficialsForUser(address)
	Official.destroy_all
	Official.reset_pk_sequence
	response = getOfficialsListWithAddress(address)
	response["officials"].map { |official|
		if official
			createOfficial(official, response)
		end
	}
end

createAllOfficialsForUser($ex_address)

binding.pry
0


