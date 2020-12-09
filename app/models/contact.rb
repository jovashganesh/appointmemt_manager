class Contact < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: false, email: true
  validates :telephone, presence: false, length: { minimum: 11 }
  validates :message, presence: true
end
