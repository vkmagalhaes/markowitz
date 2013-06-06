json.array!(@assets) do |asset|
  json.extract! asset, :codneg, :nomres, :quatot, :voltot, :expret, :risk, :historical_quotations_id
  json.url asset_url(asset, format: :json)
end