class Comment < ApplicationRecord
  validates :reply, presence: true
  belongs_to :appointment
  belongs_to :user
end
