namespace :historical_quotations do
  desc "Importa um arquivo de serie historica"
  task import: :environment do

    File.open(Rails.root.to_s + "/public/quotations/COTAHIST_A2013.TXT", "r").each_line do |line|
      next if line[0,2] != "01"

      if Asset.exists?(codneg: line[12,12].strip)
        asset = Asset.where(codneg: line[12,12].strip).first
      else
        asset = Asset.new
        asset.codneg = line[12,12].strip
        asset.nomres = line[27,12].strip
        asset.quatot = line[152,18].to_i
        asset.voltot = line[170,18].to_i
        asset.save
      end

      quotation = HistoricalQuotation.new
      quotation.cry_date  = Date.new(line[2,4].to_i, line[6,2].to_i, line[8,2].to_i)
      quotation.codbdi    = line[10,2].strip
      quotation.codneg    = line[12,12].strip
      quotation.tpmerc    = line[24,3].to_i
      quotation.nomres    = line[27,12].strip
      quotation.especi    = line[39,10].strip
      quotation.prazot    = line[49,3].strip
      quotation.modref    = line[52,4].strip
      quotation.preabe    = line[56,13].to_i
      quotation.premax    = line[69,13].to_i
      quotation.premin    = line[82,13].to_i
      quotation.premed    = line[95,13].to_i
      quotation.preult    = line[108,13].to_i
      quotation.preofc    = line[121,13].to_i
      quotation.preofv    = line[134,13].to_i
      quotation.totneg    = line[147,5].to_i
      quotation.quatot    = line[152,18].to_i
      quotation.voltot    = line[170,18].to_i
      quotation.preexe    = line[188,13].to_i
      quotation.indopc    = line[201,1].to_i
      quotation.datven    = Date.new(line[202,4].to_i, line[206,2].to_i, line[208,2].to_i)
      quotation.fatcot    = line[210,7].to_i
      quotation.ptoexe    = line[217,13].strip
      quotation.codisi    = line[230,12].strip
      quotation.dismes    = line[242,3].to_i
      quotation.asset     = asset
      quotation.save!
    end

  end
end