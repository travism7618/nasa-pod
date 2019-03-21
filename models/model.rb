# get picture of day 
# ex https://api.nasa.gov/planetary/apod?api_key=DEMO_KEY&date=2017-07-12

require 'net/http'
require 'json'
require 'pp'
require 'dotenv/load'



class Pod
    attr_reader  :url,:data_hash,:copyright,:date,:explanation,:media_url,:media_type,:copyright,:title
    def initialize(date)
        @url="https://api.nasa.gov/planetary/apod?api_key=#{ENV["NASA_API_KEY"]}&date=#{date}"
        @data_hash= JSON.parse(Net::HTTP.get(URI(@url)))
        @copyright=data_hash["copyright"]
        @date=data_hash["date"]
        @explanation=data_hash["explanation"] 
        if data_hash["hdurl"]==nil
            @media_url=data_hash["url"]
        else
            @media_url=data_hash["hdurl"]
        end
        @media_type=data_hash["media_type"]
        @title=data_hash["title"] 
    end
end



# today= Pod.new("2019-03-05")
# puts today.media_url

# puts ENV["TEST"]