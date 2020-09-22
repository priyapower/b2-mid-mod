# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)




# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


SurgeryDoctor.destroy_all
Surgery.destroy_all
Doctor.destroy_all
Hospital.destroy_all

hospital_1 = Hospital.create!(name:"Downtown Hospital")
hospital_2 = Hospital.create!(name:"Rural Hospital")

doctor_1 = hospital_1.doctors.create!(name:"Jim Lake Jr", speciality:"Heart", university:"Boston College")
doctor_2 = hospital_1.doctors.create!(name:"Claire Nunez", speciality:"Geriatrics", university:"Harvard")
doctor_3 = hospital_1.doctors.create!(name:"Barbara Lake", speciality:"OBGYN", university:"University of Austin")
doctor_4 = hospital_1.doctors.create!(name:"Toby Domzalski", speciality:"Family", university:"UTHSCSA")

doctor_5 = hospital_2.doctors.create!(name:"Blinky Galadrigal", speciality:"Lungs", university:"San Diego University")
doctor_6 = hospital_2.doctors.create!(name:"Aarghaumont", speciality:"Heart", university:"Washington State")
doctor_7 = hospital_2.doctors.create!(name:"Walt Strickler", speciality:"OBGYN", university:"Chicago College")

surgery_1 = Surgery.create!(title:"Appendix - age 13", day:"Monday", room_number:"B36")
surgery_2 = Surgery.create!(title:"Gallbladder - age 24", day:"Tuesday", room_number:"B28")
surgery_3 = Surgery.create!(title:"Brain Tumor - age 64", day:"Wednesday", room_number:"B34")
surgery_4 = Surgery.create!(title:"Open Heart - age 54", day:"Thursday", room_number:"B36")
surgery_5 = Surgery.create!(title:"Cesearian - age 28", day:"Friday", room_number:"B28")
surgery_5 = Surgery.create!(title:"Appendix - age 34", day:"Monday", room_number:"B28")

surgery_6 = Surgery.create!(title:"Cyst removal - age 17", day:"Monday", room_number:"154")
surgery_7 = Surgery.create!(title:"Liver - age 47", day:"Tuesday", room_number:"168")
surgery_8 = Surgery.create!(title:"Appendix - age 34", day:"Tuesday", room_number:"168")
surgery_9 = Surgery.create!(title:"Cesarian - age 33", day:"Wednesday", room_number:"154")
surgery_10 = Surgery.create!(title:"Appendix - age 19", day:"Thursday", room_number:"157")
surgery_11 = Surgery.create!(title:"Open Heart - age 24", day:"Friday", room_number:"157")

surgery_1.surgery_doctors.create!(doctor:doctor_1)
surgery_1.surgery_doctors.create!(doctor:doctor_2)
surgery_1.surgery_doctors.create!(doctor:doctor_3)
surgery_1.surgery_doctors.create!(doctor:doctor_4)
surgery_2.surgery_doctors.create!(doctor:doctor_4)
surgery_2.surgery_doctors.create!(doctor:doctor_2)
surgery_3.surgery_doctors.create!(doctor:doctor_1)
surgery_3.surgery_doctors.create!(doctor:doctor_3)
surgery_4.surgery_doctors.create!(doctor:doctor_1)
surgery_4.surgery_doctors.create!(doctor:doctor_3)
surgery_4.surgery_doctors.create!(doctor:doctor_4)
surgery_5.surgery_doctors.create!(doctor:doctor_2)

surgery_6.surgery_doctors.create!(doctor:doctor_5)
surgery_6.surgery_doctors.create!(doctor:doctor_6)
surgery_6.surgery_doctors.create!(doctor:doctor_7)

surgery_7.surgery_doctors.create!(doctor:doctor_7)
surgery_7.surgery_doctors.create!(doctor:doctor_5)

surgery_8.surgery_doctors.create!(doctor:doctor_5)

surgery_9.surgery_doctors.create!(doctor:doctor_6)
surgery_9.surgery_doctors.create!(doctor:doctor_7)
surgery_9.surgery_doctors.create!(doctor:doctor_5)

surgery_10.surgery_doctors.create!(doctor:doctor_6)
surgery_10.surgery_doctors.create!(doctor:doctor_7)

surgery_11.surgery_doctors.create!(doctor:doctor_5)
surgery_11.surgery_doctors.create!(doctor:doctor_6)
