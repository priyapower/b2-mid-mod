class Surgery < ApplicationRecord
  has_many :surgery_doctors
  has_many :doctors, through: :surgery_doctors

  validates_presence_of :title
  validates_presence_of :day
  validates_presence_of :room_number
end
