class Viewer
    @@a = Artii::Base.new :font => 'slant'
    
    def self.header
        system ('clear')
        puts @@a.asciify("COVID-19 Database")
        puts "By Ziming Mao and Chad Palmer"
        puts "\n"
    end
end    