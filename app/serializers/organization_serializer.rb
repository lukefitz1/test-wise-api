class OrganizationSerializer < ActiveModel::Serializer
  attributes :id, :name, :projects

  def projects
    object.projects.map do |project|
      {
        id: project.id,
        description: project.description,
        name: project.name,
        features: project.features.map do |feature|
          {
            id: feature.id,
            description: feature.description
          }
        end
      }
    end
  end
end
