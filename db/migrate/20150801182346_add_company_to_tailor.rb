class AddCompanyToTailor < ActiveRecord::Migration
  def change
    add_column :tailors, :company_id, :integer
  end
end
