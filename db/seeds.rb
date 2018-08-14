
require 'typhoeus'
require 'json'

response = Typhoeus.get('http://api.petfinder.com/pet.find?key=223507c93ee5b0b8c455ca44aa5910ed&format=json&location=11201')
whole_response=(JSON.parse(response.body))
# puts(responses)


#all the dog data
parsed_response=whole_response["petfinder"]["pets"]["pet"]

descriptions=parsed_response.map{|pet| pet["description"]["$t"]}
names=parsed_response.map{|pet| pet["name"]["$t"]}
breed_array=[]
breeds=parsed_response.map{|pet|
  if pet["breeds"]["breed"].kind_of?(Array)

    pet_breed=pet["breeds"]["breed"][0]["$t"]
    puts(pet_breed)
    # pet_breed.map{|element| puts(element["$t"])}
    breed_array.push(pet_breed)
  else

    pet_breed=pet["breeds"]["breed"]["$t"]
    puts(pet_breed)
    breed_array.push(pet_breed)
  end
}


photo_array=[]
medias=parsed_response.map{|pet|
  if pet["media"]["photos"]["photo"].kind_of?(Array)
    pet_photo=pet["media"]["photos"]["photo"][3]["$t"]
    # pet_breed.map{|element| puts(element["$t"])}
    photo_array.push(pet_photo)
  else
    pet_photo= pet["media"]["photos"]["photo"]["$t"]
    photo_array.push(pet_photo)
  end
}

#formatting data

description_array=[]
descriptions.map{|description| description_array.push(description)}
# puts (description_array[0])

name_array=[]
names.map{|name| name_array.push(name)}
# puts (name_array[0])



for i in 0..name_array.length-1 do
  Animal.create(name:name_array[i], description:description_array[i], breed:breed_array[i], image:photo_array[i], owner_id:1)
end
