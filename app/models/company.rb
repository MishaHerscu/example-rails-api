class Company < ActiveRecord::Base
  has_many :users, inverse_of: :company, dependent: :destroy
  has_many :content_posts, inverse_of: :company, dependent: :destroy
  has_many :content_recommendations, inverse_of: :company, dependent: :destroy
  has_many :hire_recommendations, inverse_of: :company, dependent: :destroy
end
