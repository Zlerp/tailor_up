class CreateAvailabilities < ActiveRecord::Migration
  def change
    create_table :availabilities do |t|
      t.datetime :start
      t.datetime :end
      t.integer :tailor_id
      t.integer :user_id
      t.boolean :booked
      t.references :tailor, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
