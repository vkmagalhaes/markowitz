class CreateAssets < ActiveRecord::Migration
  def change
    create_table :assets do |t|
      t.string :codneg
      t.string :nomres
      t.integer :quatot, limit: 8
      t.integer :voltot, limit: 8
      t.integer :expret
      t.float :risk

      t.timestamps
    end
  end
end
