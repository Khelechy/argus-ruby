require 'json'

class Helpers

    def self.is_json_string(str)
        begin
            JSON.parse(str)
            return true
          rescue JSON::ParserError => e
            return false
          end
    end

end