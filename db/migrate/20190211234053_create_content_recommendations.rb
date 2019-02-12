#
class CreateContentRecommendations < ActiveRecord::Migration
  def change
    create_table :content_recommendations do |t|
      t.references :user, index: true, foreign_key: true
      t.references :company, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
