class Asset < ActiveRecord::Base
  has_many :historical_quotations
end
