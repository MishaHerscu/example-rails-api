class TrustLink < ActiveRecord::Base
  belongs_to :user, inverse_of: :trust_link
  belongs_to :user, inverse_of: :trust_link
  belongs_to :trust_type, inverse_of: :trust_link
end
