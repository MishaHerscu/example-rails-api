#
class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.string :website_url
      t.string :blog_url
      t.string :twitter_url
      t.string :facebook_url
      t.string :linkedin_url
      t.string :job_postings_url
      t.text :why_work_here
      t.integer :max_degrees_separation

      t.timestamps null: false
    end
  end
end
