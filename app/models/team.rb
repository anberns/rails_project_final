class Team < ApplicationRecord
  has_many :coaches
  has_many :swimmers
end
