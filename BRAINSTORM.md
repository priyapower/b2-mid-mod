- DONE: DB Creation: Hospital (name)
    - has many doctors
- DONE: DB Creation: Doctor (name, speciality, university, HOSPITAL)
    - belongs to hospital
    - has many surgeries (JOIN TABLE)
- DONE: DB Creation: Surgery (title, day, room_number)
    - has many doctors (JOIN TABLE)
- DONE: DB Creation: JOIN - SurgeryDoctor (SURGERY, DOCTOR)
    - belongs to surgery
    - belongs to doctor
- DONE: Spec Feature: User Story 1 - Surgery Index
    - Can see titles (normal database)
    - Can see names of all doctors performing that surgery (JOINS)
    - titles are names that link to show page
    
1. Spec Feature: User Story 2 - Surgery Show Page
    - Click on title to get here from index page
    - Can see title and operating room of surgery (normal database)
    - Section: Other Surgeries on Sam eDay
      - Titles of all surgeries associated with same day (normal database)
      - ActiveRecord call from Surgery.all
1. Spec Feature: User Story 3 - Surgery Show Page - add additional doctor to surgery
    - A doctor must exist in the database
    - On show page - new field for adding doctor
    - Input doctor name
    - click submit
    - taken back to show
    - see new name of doctor
1. Spec Feature: User Story Extension - Surgery index NESTED under hospitals
    <!-- - Create hospital index page -->
    <!-- - Create unique hospital show page -->
    - Create hospital/id/surgeries page
    - See all titles of surgeries at hospital
    - Surgeries are grouped by operating room
      - ActiveRecord call on hospital.surgeries using Group(:room_number)
