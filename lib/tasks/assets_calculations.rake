namespace :historical_quotations do
  desc "Calcula o valor esperado e o risco de cada acao"
  task assets_calculations: :environment do

    count = 0
    total = Asset.count

    print "Calculando risco e valor esperado dos ativos - " + count.to_s + " | " + total.to_s
    Asset.all.each do |asset|
      # calculate expected return
      asset.expret = asset.historical_quotations.average(:premed).to_i
      # calculate risk
      result = ActiveRecord::Base.connection.execute(
                HistoricalQuotation.where(asset_id: asset.id).select('VARIANCE(premed)').to_sql).to_a
      asset.risk = result.first["variance"].to_f
      asset.save!

      count = count + 1
      print 13.chr
      print "Calculando risco e valor esperado dos ativos - " + count.to_s + " | " + total.to_s
    end
    
    puts "\nFinaliza com Sucesso!"
  end
end