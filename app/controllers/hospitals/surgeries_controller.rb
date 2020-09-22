class Hospitals::SurgeriesController < HospitalsController
  def surgery_index
    @hospital = Hospital.find(params[:hospital_id])
    surgeries = @hospital.surgeries.distinct
    @ordered_by_room = surgeries.group_by(&:room_number)
  end
end
