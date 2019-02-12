#
class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email, null: false, index: { unique: true }
      t.string :token, null: false, index: { unique: true }
      t.string :password_digest, null: false
      t.boolean :hbt_admin
      t.boolean :company_admin
      t.boolean :trusted_dev
      t.string :givenname, null: false
      t.string :surname, null: false
      t.string :linkedin_url, index: { unique: true }
      t.string :personal_site_url, index: { unique: true }
      t.string :twitter_url, index: { unique: true }
      t.string :github_url, index: { unique: true }
      t.string :blurb
      t.string :profile_img_url
      t.references :company, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
