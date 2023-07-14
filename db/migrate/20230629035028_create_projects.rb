class CreateProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :projects do |t|
      t.string :category
      t.string :title
      t.text :description
      t.string :url
      t.string :image
      t.integer :adds, default: 0
      t.string :shared_by

      t.timestamps
    end
  end
end
