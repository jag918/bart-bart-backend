require 'Typhoeus'
require 'json'


response = Typhoeus.get('http://api.petfinder.com/pet.find?key=223507c93ee5b0b8c455ca44aa5910ed&format=json&location=11201')
whole_response=(JSON.parse(response.body))
# puts(responses)

parsed_response=whole_response["petfinder"]["pets"]["pet"]

description=parsed_response.map{|pet| pet["description"]["$t"]}
name=parsed_response.map{|pet| pet["name"]["$t"]}
breed=parsed_response.map{|pet|pet["breeds"]["breed"]}
media=parsed_response.map{|pet| pet["media"]["photos"]["photo"]}
# puts(description)
# puts(name)
puts(breed)
# puts(media)
