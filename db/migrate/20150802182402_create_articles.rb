class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :kind
      t.integer :quantity
      t.string :other
      t.references :appointment, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
