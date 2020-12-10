class Appointment < ApplicationRecord
  belongs_to :patient
  belongs_to :nurse
  belongs_to :user
end
