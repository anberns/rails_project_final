class SwimmerEvents < ApplicationRecord
  belongs_to :swimmer 
  belongs_to :event 
end