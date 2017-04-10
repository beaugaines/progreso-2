class CreateUpdates < ActiveRecord::Migration
  def change
    create_table :updates do |t|
      t.belongs_to :user, index: true, foreign_key: true
      t.belongs_to :project, index: true, foreign_key: true
      t.text :body
      t.integer :category

      t.timestamps null: false
    end
  end
end
