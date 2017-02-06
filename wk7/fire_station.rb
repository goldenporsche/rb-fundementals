require 'httparty'

class FireStation
	def initialize
       response = HTTParty.get("https://data.cityofnewyork.us/resource/hc8x-tcnd.json?borough=manhattan&facilityname=Marine%201")
    	puts "json: #{response.body}"
 		array = JSON.parse(response.body)
 		puts array[0]["borough"]
 		# hash = array[0]
 		# puts hash["borough"]
   end
end

FireStation.new

