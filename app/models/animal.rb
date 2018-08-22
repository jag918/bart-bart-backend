class Animal < ApplicationRecord
  belongs_to :owner, class_name: 'User'
  has_many :seekers, through: :favorites
  has_many :seekers, through: :messages

end
