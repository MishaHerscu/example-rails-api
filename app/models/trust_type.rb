class TrustType < ActiveRecord::Base
  has_many :trust_links, inverse_of: :trust_type, dependent: :destroy
end
