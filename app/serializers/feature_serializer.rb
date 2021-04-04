class FeatureSerializer < ActiveModel::Serializer
  attributes :id, :description, :scenarios

  def scenarios
    object.scenarios.map do |scenario|
      {
        id: scenario.id,
        name: scenario.name,
        description: scenario.description,
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
  end
end
