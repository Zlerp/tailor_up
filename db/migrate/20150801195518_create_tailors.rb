class CreateTailors < ActiveRecord::Migration
  def change
    create_table :tailors do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password_digest
      t.string :phone
      t.string :avatar
      t.string :location

      t.timestamps null: false
    end
  end
end
