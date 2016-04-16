class CreatePoints < ActiveRecord::Migration
  def change
    create_table :points do |t|
      t.integer :point, default: 1
      t.references :user, index: true, foreign_key: true
      t.references :reward, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
