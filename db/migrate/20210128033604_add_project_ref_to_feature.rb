class AddProjectRefToFeature < ActiveRecord::Migration[5.2]
  def change
    add_reference :features, :project, type: :uuid, foreign_key: true
  end
end
