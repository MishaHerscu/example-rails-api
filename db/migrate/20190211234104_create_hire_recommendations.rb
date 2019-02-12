#
class CreateHireRecommendations < ActiveRecord::Migration
  def change
    create_table :hire_recommendations do |t|
      t.references :user, index: true, foreign_key: true
      t.references :company, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
