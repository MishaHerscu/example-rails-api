class HireRecommendationSerializer < ActiveModel::Serializer
  attributes :id, :user, :company

  def user
    object.user.id
  end

  def company
    object.company.id
  end
end
