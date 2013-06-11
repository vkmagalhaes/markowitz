namespace :historical_quotations do
  desc "Calcula a taxa de retorno da cotacoes"
  task calculate_return_rate: :environment do

    total = HistoricalQuotation.count
    count = 0
    print "Calculando taxa de retorno das cotações - 0 / " + total.to_s
    # HistoricalQuotation.all.each do |quotation|
    HistoricalQuotation.where(asset_id: Asset.find_by_quotations(102)).each do |quotation|
      previous_quotation = HistoricalQuotation.where("asset_id = ? AND cry_date < ?", 
                            quotation.asset_id, quotation.cry_date).order("cry_date DESC").first

      if previous_quotation
        quotation.return_rate = (quotation.premed - previous_quotation.premed) / previous_quotation.premed.to_d
      else
        quotation.return_rate = 0
      end
      quotation.save!
      count = count + 1
      print 13.chr
      print "Calculando taxa de retorno das cotações - " + count.to_s + " / " + total.to_s
    end

    puts " [ OK ]"

  end
end