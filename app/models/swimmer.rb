class Swimmer < ApplicationRecord
  has_secure_password

  validates :name, presence: true 
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true

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

  def self.find_or_create_by_omniauth(auth)
    oauth_name = auth["info"]["name"]
    oauth_email = auth["info"]["email"] 
    @swimmer = self.find_by(email: oauth_email)
    if !@swimmer 
      @swimmer = self.new(name: oauth_name, email: oauth_email, password: "password", team_id: "1")
      if @swimmer.valid?
        @swimmer.save
      end
    end
    @swimmer
  end

end
