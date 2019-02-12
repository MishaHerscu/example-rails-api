#
class CreateTrustLinks < ActiveRecord::Migration
  def change
    create_table :trust_links do |t|
      t.references :user, index: true, foreign_key: true, null: false
      t.references :trusted_user, null: false
      t.index [:trusted_user_id, :user_id], unique: true
      t.references :trust_type, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
