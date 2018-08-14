class Favorite < ApplicationRecord
  belongs_to :seeker, class_name: 'User'
  belongs_to :animal_favorite, class_name: 'Animal'
end
