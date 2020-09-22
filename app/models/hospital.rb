class Hospital < ApplicationRecord
  has_many :doctors
  has_many :surgery_doctors, through: :doctors
  has_many :surgeries, through: :surgery_doctors

  validates_presence_of :name
end
