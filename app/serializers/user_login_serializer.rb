#
class UserLoginSerializer < ActiveModel::Serializer
  attributes :id, :email, :token, :surname, :givenname, :hbt_admin,
  :company_admin, :trusted_dev, :linkedin_url, :personal_site_url, :twitter_url,
  :github_url, :blurb, :profile_img_url, :content_recommendations,
  :hire_recommendations, :trust_links, :company

  def token
    Rails.application.message_verifier(:signed_token).generate(object.token)
  end

  def content_recommendations
    object.content_recommendations.pluck(:id)
  end

  def hire_recommendations
    object.hire_recommendations.pluck(:id)
  end

  def trust_links
    object.trust_links.pluck(:id)
  end

  def company
    object.company.id
  end
end
