class Event < ApplicationRecord
  has_many :swimmer_events
  has_many :swimmers, through: :swimmer_events

  validates :name, presence: true, uniqeness: true 
  validates :distance, presence: true
  validates :stroke, presence: true
end
