class AddReturnRateToHistoricalQuotations < ActiveRecord::Migration
  def change
    add_column :historical_quotations, :return_rate, :decimal
  end
end
