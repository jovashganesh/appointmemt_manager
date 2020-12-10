class Patient < ApplicationRecord
  has_one :user
  has_many :appointments
  has_many :nurses, through: :appointments
end
