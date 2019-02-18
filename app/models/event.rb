class Event < ApplicationRecord
  has_many :swimmer_events
  has_many :swimmers, through: :swimmer_events
end
