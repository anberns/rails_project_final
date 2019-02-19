class Event < ApplicationRecord
  has_many :swimmer_events
  has_many :swimmers, through: :swimmer_events, dependent: :destroy

  validates :name, presence: true, uniqueness: true 
  validates :distance, presence: true
  validates :stroke, presence: true

  def self.sort
    sorted_events = Event.all.sort_by { |event| event.distance }
  end
end
