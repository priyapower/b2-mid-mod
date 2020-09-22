require 'rails_helper'

RSpec.describe Hospital, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
  end

  describe 'relationships' do
    it { should have_many :doctors}
    it { should have_many(:surgery_doctors).through(:doctors)}
    it { should have_many(:surgeries).through(:surgery_doctors)}
  end
end
