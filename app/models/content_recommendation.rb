class ContentRecommendation < ActiveRecord::Base
  belongs_to :user, inverse_of: :content_recommendations
  belongs_to :company, inverse_of: :content_recommendations
end
