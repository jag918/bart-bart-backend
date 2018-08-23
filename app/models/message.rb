class Message < ApplicationRecord
   belongs_to :sender, class_name: 'User'
   belongs_to :receiver, class_name: 'User'
   belongs_to :animal_message, class_name: 'Animal'

end
