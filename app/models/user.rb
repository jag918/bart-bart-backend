class User < ApplicationRecord
  has_many :animals, foreign_key: 'owner_id'
  has_many :favorites, foreign_key: 'seeker_id'
  

end
