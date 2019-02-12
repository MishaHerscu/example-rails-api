class TrustLinkSerializer < ActiveModel::Serializer
  attributes :id, :user, :trusted_user, :trust_type

  def user
    object.user.id
  end

  def trusted_user
    object.trusted_user.id
  end

  def trust_type
    object.trust_type.id
  end
end
