class AddImageToTailors < ActiveRecord::Migration
  def change
    add_column :tailors, :image, :string
  end
end
