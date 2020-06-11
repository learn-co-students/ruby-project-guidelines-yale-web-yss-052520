# Exports data

class Exporter

    def self.graph(input)
        if input[0][2] != Query.all.first.return[0][2]
            puts ("Increment!")
        end
        puts ("This is a graph for " + Query.all.first.case_type)
        max = 0.00
        input.each do |arr|
            if arr[2] > max
                max = arr[2].to_f
            end
        end
        base = 60.00
        country_name = ""
        input.each do |arr|
            if country_name != arr[0]
                country_name = arr[0]
                puts("")
                puts("-----------------------")
                puts("The graph for " + country_name + " (from: " + input[0][1].to_s[0..9] + " to: " + input[-1][1].to_s[0..9] + ")")
                puts ("----------------------")
                puts("")
            end
            percentage = (arr[2]/max).round(2)
            print "#{arr[1].to_s[0..9]}: "
            number_of_stars = percentage*base.round
            for i in 1..number_of_stars do
                print "*"
            end
            print " #{(percentage*100).to_s[0..3]}% - #{arr[2]} cases"
            puts ""
        end
    end
    
    
    def self.export_txt(input)
        puts("File is going to be exported to the current folder")
        out_file = File.new("data.txt", "w")
        if input[0][2] != Query.all.first.return[0][2]
            out_file.puts("Increment!")
        end
        country_name = ""
        out_file.puts ("This is a chart for " + Query.all.first.case_type)

        input.each do |arr|
            if country_name != arr[0]
                country_name = arr[0]
                out_file.puts("")
                out_file.puts("-----------------------")
                out_file.puts("The chart for " + country_name + " (from: " + input[0][1].to_s[0..9] + " to: " + input[-1][1].to_s[0..9] + ")")
                out_file.puts ("----------------------")
                out_file.puts("")
            end
            out_file.puts("Date: " + arr[1].to_s[0..9] + " Cases: " + arr[2].to_s)
        end
        out_file.close
        puts "Done! File data.txt has been created"
    end
end