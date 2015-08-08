class AddColumnToAvailabilities < ActiveRecord::Migration
  def change
    add_column :availabilities, :requested, :boolean
  end
end
