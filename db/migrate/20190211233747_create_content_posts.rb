#
class CreateContentPosts < ActiveRecord::Migration
  def change
    create_table :content_posts do |t|
      t.string :name
      t.references :company, index: true, foreign_key: true
      t.string :url
      t.string :content

      t.timestamps null: false
    end
  end
end
