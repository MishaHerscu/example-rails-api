class CompanySerializer < ActiveModel::Serializer
  attributes :id, :name, :website_url, :blog_url, :twitter_url, :facebook_url,
  :linkedin_url, :job_postings_url, :why_work_here, :max_degrees_separation,
  :users, :content_posts, :content_recommendations, :hire_recommendations

  def users
    object.users.pluck(:id)
  end

  def content_posts
    object.content_posts.pluck(:id)
  end

  def content_recommendations
    object.content_recommendations.pluck(:id)
  end

  def hire_recommendations
    object.hire_recommendations.pluck(:id)
  end
end
