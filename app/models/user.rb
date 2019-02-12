#
class User < ActiveRecord::Base
  include Authentication
  has_many :examples, inverse_of: :user, dependent: :destroy

  has_many :content_recommendations, inverse_of: :user, dependent: :destroy
  has_many :hire_recommendations, inverse_of: :user, dependent: :destroy
  has_many :trust_links, inverse_of: :user, dependent: :destroy

  belongs_to :company, inverse_of: :users
end
