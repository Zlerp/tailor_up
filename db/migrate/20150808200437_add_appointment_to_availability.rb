class AddAppointmentToAvailability < ActiveRecord::Migration
  def change
    add_reference :availabilities, :appointment, index: true, foreign_key: true
  end
end
