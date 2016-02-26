class CreateMaterials < ActiveRecord::Migration
  def change
    create_table :materials do |t|
      t.string :title
      t.string :description
      t.integer :course_id

      t.timestamps null: false
    end
  end
end
