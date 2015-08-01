class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.string :stages
      t.string :address
      t.datetime :appointment_time
      t.datetime :due_time
      t.string :service
      t.string :pickup_location

      t.timestamps null: false
    end
  end
end
