require 'httparty'
require 'colorize'
class Chuck
    def initialize(name)
        @name = name
    end

    def help
        puts "HIIIIIIIIIIIIIIIIIIIIIIII"
    end


    #some jokes are actually missing
    def get_jokes_by_id(id)
        jokeid = id.to_s
        response = HTTParty.get("http://api.icndb.com/jokes/"+jokeid)
        if response["type"] != "success"
            puts "there is no joke".colorize:red
        else
            puts response["value"]["joke"]

        end

    end

    def replace_name(name)
        response = HTTParty.get("http://api.icndb.com/jokes/random")
        joke = response["value"]["joke"]
        joke["Chuck Norris"] = "#{@name}"
        puts joke

    end

    def random
        response = HTTParty.get("http://api.icndb.com/jokes/random")
        puts response["value"]["joke"]
    end

end


newchuck = Chuck.new("me")
newchuck.get_jokes_by_id(100)
newchuck.random
newchuck.help
newchuck.replace_name("Wonjun")