class Viewer
    @@a = Artii::Base.new :font => 'slant'
    
    def self.header
        system ('clear')
        puts @@a.asciify("COVID-19 App")
        puts "By Ziming Mao and Chad Palmer"
        puts "\n"
    end
end    