class Patient < ApplicationRecord
  has_many :appointments
  has_many :nurses, through: :appointments
end
