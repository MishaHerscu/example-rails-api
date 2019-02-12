#
class CreateTrustTypes < ActiveRecord::Migration
  def change
    create_table :trust_types do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
