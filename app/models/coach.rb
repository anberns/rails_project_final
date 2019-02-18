class Coach < ApplicationRecord
  has_secure_password

  belongs_to :team
  has_many :swimmers, through: :team
end
