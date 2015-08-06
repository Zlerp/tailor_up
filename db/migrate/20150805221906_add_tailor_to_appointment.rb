class AddTailorToAppointment < ActiveRecord::Migration
  def change
    add_column :appointments, :tailor_id, :integer
  end
end
