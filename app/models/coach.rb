class Coach < ApplicationRecord
  has_secure_password

  belongs_to :team
  has_many :swimmers, through: :team

  validates :name, presence: true 
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
end
