require "rails_helper"

RSpec.describe "Hospital/Surgeries Index Page", type: :feature do
  describe "As a visitor" do
    before :each do
      @hospital_1 = Hospital.create!(name:"Downtown Hospital")
      @hospital_2 = Hospital.create!(name:"Rural Hospital")

      @doctor_1 = @hospital_1.doctors.create!(name:"Jim Lake Jr", speciality:"Heart", university:"Boston College")
      @doctor_2 = @hospital_1.doctors.create!(name:"Claire Nunez", speciality:"Geriatrics", university:"Harvard")
      @doctor_3 = @hospital_1.doctors.create!(name:"Barbara Lake", speciality:"OBGYN", university:"University of Austin")
      @doctor_4 = @hospital_1.doctors.create!(name:"Toby Domzalski", speciality:"Family", university:"UTHSCSA")

      @doctor_5 = @hospital_2.doctors.create!(name:"Blinky Galadrigal", speciality:"Lungs", university:"San Diego University")
      @doctor_6 = @hospital_2.doctors.create!(name:"Aarghaumont", speciality:"Heart", university:"Washington State")
      @doctor_7 = @hospital_2.doctors.create!(name:"Walt Strickler", speciality:"OBGYN", university:"Chicago College")

      @surgery_1 = Surgery.create!(title:"Appendix - age 13", day:"Monday", room_number:"B36")
      @surgery_2 = Surgery.create!(title:"Gallbladder - age 24", day:"Tuesday", room_number:"B28")
      @surgery_3 = Surgery.create!(title:"Brain Tumor - age 64", day:"Wednesday", room_number:"B34")
      @surgery_4 = Surgery.create!(title:"Open Heart - age 54", day:"Thursday", room_number:"B36")
      @surgery_5 = Surgery.create!(title:"Cesearian - age 28", day:"Friday", room_number:"B28")
      @surgery_12 = Surgery.create!(title:"Appendix - age 34", day:"Monday", room_number:"B28")

      @surgery_6 = Surgery.create!(title:"Cyst removal - age 17", day:"Monday", room_number:"154")
      @surgery_7 = Surgery.create!(title:"Liver - age 47", day:"Tuesday", room_number:"168")
      @surgery_8 = Surgery.create!(title:"Appendix - age 34", day:"Tuesday", room_number:"168")
      @surgery_9 = Surgery.create!(title:"Cesarian - age 33", day:"Wednesday", room_number:"154")
      @surgery_10 = Surgery.create!(title:"Appendix - age 19", day:"Thursday", room_number:"157")
      @surgery_11 = Surgery.create!(title:"Open Heart - age 24", day:"Friday", room_number:"157")

      @surgery_1.surgery_doctors.create!(doctor:@doctor_1)
      @surgery_1.surgery_doctors.create!(doctor:@doctor_2)
      @surgery_1.surgery_doctors.create!(doctor:@doctor_3)
      @surgery_1.surgery_doctors.create!(doctor:@doctor_4)

      @surgery_2.surgery_doctors.create!(doctor:@doctor_4)
      @surgery_2.surgery_doctors.create!(doctor:@doctor_2)

      @surgery_3.surgery_doctors.create!(doctor:@doctor_1)
      @surgery_3.surgery_doctors.create!(doctor:@doctor_3)

      @surgery_4.surgery_doctors.create!(doctor:@doctor_1)
      @surgery_4.surgery_doctors.create!(doctor:@doctor_3)
      @surgery_4.surgery_doctors.create!(doctor:@doctor_4)

      @surgery_5.surgery_doctors.create!(doctor:@doctor_2)

      @surgery_12.surgery_doctors.create!(doctor:@doctor_4)
      @surgery_12.surgery_doctors.create!(doctor:@doctor_1)

      @surgery_6.surgery_doctors.create!(doctor:@doctor_5)
      @surgery_6.surgery_doctors.create!(doctor:@doctor_6)
      @surgery_6.surgery_doctors.create!(doctor:@doctor_7)

      @surgery_7.surgery_doctors.create!(doctor:@doctor_7)
      @surgery_7.surgery_doctors.create!(doctor:@doctor_5)

      @surgery_8.surgery_doctors.create!(doctor:@doctor_5)

      @surgery_9.surgery_doctors.create!(doctor:@doctor_6)
      @surgery_9.surgery_doctors.create!(doctor:@doctor_7)
      @surgery_9.surgery_doctors.create!(doctor:@doctor_5)

      @surgery_10.surgery_doctors.create!(doctor:@doctor_6)
      @surgery_10.surgery_doctors.create!(doctor:@doctor_7)

      @surgery_11.surgery_doctors.create!(doctor:@doctor_5)
      @surgery_11.surgery_doctors.create!(doctor:@doctor_6)
    end

    it "can have a hospitals index" do
      visit "/hospitals"

      expect(page).to have_link(@hospital_1.name)
      expect(page).to have_link(@hospital_2.name)
    end

    it "can have a hospital show page" do
      visit "/hospitals"

      expect(page).to have_link(@hospital_2.name)
      click_link @hospital_2.name

      expect(current_path).to eq("/hospitals/#{@hospital_2}")
      expect(page).to have_content(@hospital_2.name)
      expect(page).to have_link("Surgeries at this Hospital")
    end

    it "can have a link to surgeries at hospital on show page" do
      visit "/hospitals/#{@hospital_2}"
      expect(page).to have_link("Surgeries at this Hospital")
      click_link "Surgeries at this Hospital"
      expect(current_path).to eq("/hospitals/#{@hospital_2.id}/surgeries")
    end

    it "can show surgerie titles grouped by operating room" do
      visit "/hospitals/#{@hospital_2.id}/surgeries"

      within "#room-#{surgery_6.room_number}" do
        expect(page).to have_content(@surgery_6.title)
        expect(page).to have_content(@surgery_9.title)
      end

      within "#room-#{surgery_7.room_number}" do
        expect(page).to have_content(@surgery_7.title)
        expect(page).to have_content(@surgery_8.title)
      end

      within "#room-#{surgery_10.room_number}" do
        expect(page).to have_content(@surgery_10.title)
        expect(page).to have_content(@surgery_11.title)
      end

      expect(page).to_not have_content(@surgery_1.title)
      expect(page).to_not have_content(@surgery_2.title)
      expect(page).to_not have_content(@surgery_3.title)
      expect(page).to_not have_content(@surgery_4.title)
      expect(page).to_not have_content(@surgery_5.title)
      expect(page).to_not have_content(@surgery_12.title)
    end

  end
end
