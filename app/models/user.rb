class User < ApplicationRecord
  has_many :animals, foreign_key: 'owner_id'
  has_many :favorites, foreign_key: 'seeker_id'
  has_many :animal_favorites, through: :favorites, foreign_key: 'seeker_id'

  has_many :messages, foreign_key: 'sender'
  has_many :animal_messages, through: :messages, foreign_key: 'receiver'


  def formatted
    {
      user: self
    }
  end
end
