class Doctor < ApplicationRecord
  belongs_to :hospital

  validates_presence_of :name
  validates_presence_of :speciality
  validates_presence_of :university
end
