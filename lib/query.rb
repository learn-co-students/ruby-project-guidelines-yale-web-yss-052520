# Reads data from database

class Query
    attr_accessor :date_type, :starting_date, :ending_date, :single_date, :case_type

    @@all = []

    def initialize
        @@all << self
    end

    def self.all
        @@all
    end

    def self.destroy_all
        @@all = []
    end

    def self.create_date_array(date)
        date.split('/')
    end

    # This method needs to print out all information for all countries with clear delineations between them
    def print
        case date_type
        when "single"
            pp search_date(single_date)
        when "range"
            pp search_date_range(starting_date, ending_date)
        end
    end

    def search_date(date_array)
        date = "2020-#{date_array[1]}-#{date_array[0]} 00:00:00 UTC"
        # "Date": "2020-02-26 00:00:00 UTC"

        data = Day.all.select{|day| day.date == date}
        format(data)
    end

    def search_date_range(starting_date_array, ending_date_array)
        starting_date = "2020-#{starting_date_array[1]}-#{starting_date_array[0]} 00:00:00 UTC"
        ending_date = "2020-#{ending_date_array[1]}-#{ending_date_array[0]} 00:00:00 UTC"

        data = []
        starting_triggered = false
        Day.all.each do |element|
            if element["date"] == starting_date
                starting_triggered = true
            end
            if starting_triggered == true
                data << element
            end
            if element["date"] == ending_date
                break
            end
        end
        format(data)
    end

    def format(data)
        data.map do |element| 
            [
            element.country.name,
            element["date"],
            element[case_type]
            ]
        end
    end
end