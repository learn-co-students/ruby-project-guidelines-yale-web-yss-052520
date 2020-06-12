class User < ActiveRecord::Base
    has_many :emails 
    has_many :officials, through: :emails 

    def getOfficialsListWithAddress
        api_key = "AIzaSyCb-lOzV8VGKHM495tFhMF_S_-PhmVFNc4"
        url = "https://www.googleapis.com/civicinfo/v2/representatives?address=#{self.address}&key=#{api_key}"
        apiResponse = HTTParty.get(url)
    end

    def createOfficial(officialHash, apiResponse)
        name = officialHash["name"]
        address = officialHash["address"] ? officialHash["address"][0]: nil
        location = address ? "#{address["line1"]}, #{address["city"]}, #{address["state"]}, #{address["zip"]}":nil
        email = officialHash["emails"]? officialHash["emails"][0]:nil
        officialIndex = apiResponse["officials"].find_index(officialHash)
        role = apiResponse["offices"].find{ |office| 
            office["officialIndices"].include?(officialIndex)
        }["name"]

        Official.create(name: name, location: location, email: email, role: role)
    end 

    def createAllOfficialsAndEmailsForUser
        response = getOfficialsListWithAddress

        if !response["officials"]
        	puts "You have no elected officials. That address is probably incomplete (include \"street address, city, state zip code\" and try again.)"
        	exit(1)
        end

        response["officials"].each { |official|
            officialInstance = Official.where(name: official["name"]).exists? ? Official.where(name: official["name"])[0] : createOfficial(official, response)
            createEmail(officialInstance)
        }
    end

    def createEmail(official)
    	newLine = "%0D%0A"
    	message = "Hi #{official.name}! #{newLine}#{newLine}"\
    			  "I\'m #{self.name} and I\'m one of your constituents. "\
				  "I\'m writing to urge you to support all measures against anti-black racism and police brutality. "\
				  "I hope you do everything in your power to defund the police, switch to a community-controlled model of policing, "\
				  "dissolve and rebuild the police department based on equitable values, take policing out of our schools, "\
				  "and support livable prison conditions with proper healthcare and wages for forced labor.#{newLine}" \
				  "#{self.comment}#{newLine}#{newLine}" \
				  "Sincerely,#{newLine} #{self.name}"
		subject = "Support for Black Lives"

		link = official.email ? "mailto:#{official.email}?subject=#{subject}&body=#{message}" : nil
		Email.create(message: message, subject: subject, link:link, user_id: self.id, official_id: official.id)
    end

    def getEmailsForUser
    	Email.all.select{|email| 
    		email.user_id == self.id
    	}
    end

    def getSendableEmailsForUser
    	getEmailsForUser.select{|email|
			email.link
		}
	end

    def getAllOfficialsForUser
		getEmailsForUser.map{|email|
			Official.where(["id = :i", {i: email.official_id}])
		}.flatten
    end

    def getEmailableOfficialsForUser
		getSendableEmailsForUser.map{|email|
			Official.where(["id = :i", {i: email.official_id}])
		}.flatten
    end

    def printOfficials
    	getAllOfficialsForUser.each{ |official|
    		print "#{official.name}, #{official.role} \n"
    	}
    end

	def printEmailableOfficials
    	getEmailableOfficialsForUser.each{ |official|
    		print "#{official.name}, #{official.role} \n"
    	}
    end

    def printOfficialAndLinkForAllEmails
    	officials = getEmailableOfficialsForUser
    	emailLinks = getLinksToAllSendableEmails

    	if officials.length == emailLinks.length
    		officials.each_with_index { |official, index|
    			print "#{official.name}, #{official.role} \nHere's their link: "
    			print "\n\n\t#{emailLinks[index]}\n\n\n".colorize(:blue)
    		}
    	else
    		puts "There was an error. Please rerun the program"
    	end
    end

    def printOneRandomEmailWithOfficialAndLink
    	email = getSendableEmailsForUser.sample
    	official = Official.where(["id = :i", {i: email.official_id}]).first
    	print "#{official.name}, #{official.role} \nHere's their link: \n\n\t"
    	print "#{email.link}\n\n\n".colorize(:blue)
    end

    def getLinksToAllSendableEmails
    	getSendableEmailsForUser.map{|email|
    		email.link
    	}
    end

end 