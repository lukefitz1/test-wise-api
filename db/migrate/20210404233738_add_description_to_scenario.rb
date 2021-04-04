class AddDescriptionToScenario < ActiveRecord::Migration[5.2]
  def change
    add_column :scenarios, :description, :string
  end
end
