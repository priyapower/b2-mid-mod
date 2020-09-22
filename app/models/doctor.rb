class Doctor < ApplicationRecord
  belongs_to :hospital
  has_many :surgery_doctors
  has_many :surgeries, through: :surgery_doctors

  validates_presence_of :name
  validates_presence_of :speciality
  validates_presence_of :university
end
