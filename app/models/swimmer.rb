class Swimmer < ApplicationRecord
  belongs_to :team
  has_many :coaches, through: :team
  has_many :swimmer_events
  has_many :events, through: :swimmer_events
end
