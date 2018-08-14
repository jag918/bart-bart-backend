#
# require 'typhoeus'
# require 'json'
#
# response = Typhoeus.get('http://api.petfinder.com/pet.find?key=223507c93ee5b0b8c455ca44aa5910ed&format=json&location=11201')
# whole_response=(JSON.parse(response.body))
# # puts(responses)
#
#
# #all the dog data
# parsed_response=whole_response["petfinder"]["pets"]["pet"]
#
# descriptions=parsed_response.map{|pet| pet["description"]["$t"]}
# names=parsed_response.map{|pet| pet["name"]["$t"]}
# # breeds=parsed_response.map{|pet|
# #   if pet["breeds"]["breed"].kind_of?(Array)
# #     breed_array=[]
# #     pet_breed=pet["breeds"]["breed"]
# #     pet_breed.map{|element| puts(element["$t"])}
# #   else
# #     puts pet["breeds"]["breed"]["$t"]
# #   end
# # }
# # medias=parsed_response.map{|pet|
# #   if pet["media"]["photos"]["photo"].kind_of?(Array)
# #     photo_array=[]
# #     pet_breed=pet["media"]["photos"]["photo"]
# #     pet_breed.map{|element| puts(element["$t"])}
# #   else
# #     puts ""
# #     # pet["media"]["photos"]["photo"]["$t"]
# #   end
# # }
#
# #formatting data
# description_array=[]
# descriptions.map{|description| description_array.push(description)}
# # puts (description_array.length)
#
# name_array=[]
# names.map{|name| name_array.push(name)}
# # puts (name_array[0])
#
#
# 
# for i in 0..name_array.length do
#   Animal.create(name:name_array[i], description:description_array[i], breed:breed_array[i], image:photo_array[i], owner_id:1)
# end
