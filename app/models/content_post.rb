class ContentPost < ActiveRecord::Base
  belongs_to :company, inverse_of: :content_posts
end
