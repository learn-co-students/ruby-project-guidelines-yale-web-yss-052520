class Request
    attr_accessor :api, :locations, :dates, :case_type

    def initialize(args)
        @api = args[:api]
        @locations = args[:locations]
        @dates = args[:dates]
        @case_type = args[:case_type]
    end
end