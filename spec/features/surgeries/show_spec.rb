require "rails_helper"

RSpec.describe "Surgery Show Page", type: :feature do
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

    it "can connect to show page path" do
      visit "/surgeries"
      expect(page).to have_link(@surgery_1.title)
      click_link @surgery_1.title
      expect(current_path).to eq("/surgeries/#{@surgery_1.id}")
    end

    it "can see pertinent info on show page" do
      visit "/surgeries/#{@surgery_1.id}"
      within "#surgery-information" do
        expect(page).to have_content(@surgery_1.title)
        expect(page).to have_content(@surgery_1.room_number)
      end

      within "#other-surgeries-by-day" do
        expect(page).to have_content("Other Surgeries Occuring on #{@surgery_1.day}")
        expect(page).to have_content(@surgery_12.title)
        expect(page).to have_content(@surgery_6.title)
      end
    end

    it "can see only doctors names associate with surgery on show page" do
      visit "/surgeries/#{@surgery_2.id}"
      within "#surgery-information" do
        expect(page).to have_content("Doctors on this Surgery")
        expect(page).to have_content(@doctor_2.name)
        expect(page).to have_content(@doctor_4.name)
      end
    end

    it "can add an existing doctor to a surgery" do
      visit "/surgeries/#{@surgery_8.id}"

      within "#surgery-information" do
        expect(page).to have_content("Doctors on this Surgery")
        expect(page).to have_content(@doctor_5.name)
      end

      within "#add-new-doc" do
        expect(page).to have_content("Add a doctor to this Surgery")
        fill_in :doctor_name, with: @doctor_6.name
        click_on "Add this Doctor"
      end

      within "#surgery-information" do
        expect(page).to have_content("Doctors on this Surgery")
        expect(page).to have_content(@doctor_5.name)
        expect(page).to have_content(@doctor_6.name)
      end
    end
  end
end
