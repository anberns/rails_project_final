class Coach < ApplicationRecord
  belongs_to :team
  has_many :swimmers, through: :team
end
