class Seeder
    def self.clear
        Country.destroy_all
        Day.destroy_all
        Country.reset_pk_sequence
        Day.reset_pk_sequence
    end

    def self.seed(country_info)
        country_name = country_info.first["Country"]
        country = Country.create(name: country_name)

        country_info.each do |date_info|
            Day.create(date: date_info["Date"], country_id: country.id, confirmed_cases: date_info["Confirmed"], active_cases: date_info["Active"], death_cases: date_info["Deaths"], recovered_cases: date_info["Recovered"])
        end
    end
end