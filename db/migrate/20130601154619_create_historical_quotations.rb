class CreateHistoricalQuotations < ActiveRecord::Migration
  def change
    create_table :historical_quotations do |t|
      t.date :cry_date
      t.string :codbdi
      t.string :codneg
      t.integer :tpmerc
      t.string :nomres
      t.string :especi
      t.string :prazot
      t.string :modref
      t.integer :preabe, limit: 8
      t.integer :premax, limit: 8
      t.integer :premin, limit: 8
      t.integer :premed, limit: 8
      t.integer :preult, limit: 8
      t.integer :preofc, limit: 8
      t.integer :preofv, limit: 8
      t.integer :totneg
      t.integer :quatot, limit: 8
      t.integer :voltot, limit: 8
      t.integer :preexe, limit: 8
      t.integer :indopc
      t.date :datven
      t.integer :fatcot
      t.string :ptoexe
      t.string :codisi
      t.integer :dismes
      t.references :asset, index: true

      t.timestamps
    end
  end
end
