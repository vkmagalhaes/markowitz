class ChangeExpretAndRiskFromAssets < ActiveRecord::Migration
  def up
   change_column :assets, :expret, :decimal
   change_column :assets, :risk, :decimal
  end

  def down
   change_column :assets, :expret, :integer
   change_column :assets, :risk, :float
  end
end
