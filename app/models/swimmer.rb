class Swimmer < ApplicationRecord
  has_secure_password

  validates :name, presence: true 
  validates :email, presence: true, uniqueness: true

  belongs_to :team
  has_many :swimmer_events
  has_many :events, through: :swimmer_events, dependent: :destroy
  accepts_nested_attributes_for :events

  def events_attributes=(events_attributes)
    puts events_attributes
    events_attributes.values.each do |event_attribute|
      if event_attribute[:name] != "" || event_attribute[:distance] != "" || event_attribute[:stroke] != ""
        event = Event.find_or_create_by(event_attribute)
        self.events << event
      end
    end
  end

  # help from https://medium.com/@kaileegray/adding-omniauth-to-rails-web-app-2491392787fa
  def self.find_or_create_by_omniauth(auth)
    oauth_name = auth["info"]["name"]
    oauth_email = auth["info"]["email"] 
    @swimmer = self.find_by(email: oauth_email)
    if !@swimmer 
      @swimmer = self.new(name: oauth_name, email: oauth_email, password: "password", team_id: "4")
      if @swimmer.valid?
        @swimmer.save
      end
    end
    @swimmer
  end

  def get_events_and_times
    data = []
    self.swimmer_events.each do |swimmer_event|
      event_name = Event.find(swimmer_event.event_id).name
      data_hash = {
        :name => event_name,
        :time => swimmer_event.personal_record,
        :id => swimmer_event.id
      }
      data << data_hash
    end
    puts data
    data
  end

end
