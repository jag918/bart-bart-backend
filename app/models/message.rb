class Message < ApplicationRecord
   belongs_to :seeker, class_name: 'User'
   belongs_to :animal_message, class_name: 'Animal'

end
