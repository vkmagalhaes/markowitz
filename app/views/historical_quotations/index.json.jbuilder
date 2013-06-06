json.array!(@historical_quotations) do |historical_quotation|
  json.extract! historical_quotation, :cry_date, :codbdi, :codneg, :tpmerc, :nomres, :especi, :prazot, :modref, :preabe, :premax, :premin, :premed, :preult, :preofc, :preofv, :totneg, :quatot, :voltot, :preexe, :indopc, :datven, :fatcot, :ptoexe, :codisi, :dismes
  json.url historical_quotation_url(historical_quotation, format: :json)
end