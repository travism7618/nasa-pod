# get picture of day 
# ex https://api.nasa.gov/planetary/apod?api_key=DEMO_KEY&date=2017-07-12

require 'net/http'
require 'json'
require 'pp'
require 'dotenv/load'



class Pod
    attr_reader  :url,:data_hash,:copyright,:date,:explanation,:media_url,:media_type,:copyright,:title
    # When a pod instance is intialized it takes in a date 
    def initialize(date)
        @url="https://api.nasa.gov/planetary/apod?api_key=#{ENV["NASA_API_KEY"]}&date=#{date}" # that date is put into the nasa api url along with the api key from the . env file
        @data_hash= JSON.parse(Net::HTTP.get(URI(@url))) #the modified url returns a hash, which is taken and saved using this line of code
        # all items of the hash is saved as an instance variable
        @copyright=data_hash["copyright"]
        @date=data_hash["date"]
        @explanation=data_hash["explanation"] 
        # some hashes have a hd url and some don't. If there is the option for the hd url then this code saves it as the url for the media, if there is not then this code takes the regular media url 
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