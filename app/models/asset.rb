class Asset < ActiveRecord::Base
  has_many :historical_quotations

  def self.find_by_quotations(quotations_number)
    Asset.find_by_sql('SELECT "assets"."id", "assets"."codneg", ' + 
      '"assets"."nomres", "assets"."expret", "assets"."risk", count("historical_quotations"."id") ' +
      'FROM "assets" LEFT OUTER JOIN "historical_quotations" ON ' + 
      '"historical_quotations"."asset_id" = "assets"."id" GROUP BY assets.id ' +
      'HAVING count("historical_quotations"."id") = ' + quotations_number.to_s)
  end

  def self.get_historical_quotations_matrix
    columns = []
    Asset.find_by_quotations(102).each do |asset|

      columns << asset.historical_quotations.collect { |q| q.return_rate - asset.expret }
    end

    matrix = Matrix::columns(columns)

#    scilab_matrix = "["
#    last_index = 0
#    matrix.each_with_index do |element, index|
#      if index != last_index
#        scilab_matrix += ";" 
#        last_index = index
#      end
#
#      scilab_matrix += element.to_s + " "
#    end
#    scilab_matrix += "]"
#
#    return scilab_matrix
    
    return matrix
  end
end
