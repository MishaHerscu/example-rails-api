class HireRecommendation < ActiveRecord::Base
  belongs_to :user, inverse_of: :hire_recommendations
  belongs_to :company, inverse_of: :hire_recommendations
end
