# Writes data to database

class Seeder
    def self.clear
        Country.destroy_all
        Day.destroy_all
        Country.reset_pk_sequence
        Day.reset_pk_sequence
    end

    def self.seed(country_data)
        country_name = country_data.first["Country"]
        country = Country.create(name: country_name)

        country_data.each do |date_data|
            Day.create(
                date: date_data["Date"],
                country_id: country.id,
                confirmed_cases:
                date_data["Confirmed"],
                active_cases: date_data["Active"],
                death_cases: date_data["Deaths"],
                recovered_cases: date_data["Recovered"]
                )
        end
    end
end