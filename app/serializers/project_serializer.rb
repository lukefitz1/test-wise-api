class ProjectSerializer < ActiveModel::Serializer
  attributes :id, :description, :name, :features

  def features
    object.features.map do |feature|
      {
        id: feature.id,
        description: feature.description,
        scenarios: feature.scenarios.map do |scenario|
          {
            id: scenario.id,
            name: scenario.name,
            steps: scenario.steps.map do |step|
              {
                id: step.id,
                keyword: step.keyword,
                step: step.step,
                order: step.order
              }
            end
          }
        end
      }
    end
  end
end
