class ContentPostSerializer < ActiveModel::Serializer
  attributes :id, :name, :url, :content, :company

  def company
    object.company.id
  end
end
