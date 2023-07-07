class CreateProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :projects do |t|
      t.integer :category_id
      t.string :title
      t.text :description
      t.string :url
      t.string :image
      t.integer :adds, default: 0

      t.timestamps
    end
  end
end
