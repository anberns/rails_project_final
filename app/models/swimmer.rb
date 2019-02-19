class Swimmer < ApplicationRecord
  has_secure_password

  belongs_to :team
  has_many :coaches, through: :team
  has_many :swimmer_events
  has_many :events, through: :swimmer_events, dependent: :destroy
  accepts_nested_attributes_for :events
  def events_attributes=(events_attributes)
    events_attributes.values.each do |event_attribute|
      event = Event.find_or_create_by(event_attribute)
      self.events << event
    end
  end

end
