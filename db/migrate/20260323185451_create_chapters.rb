class CreateChapters < ActiveRecord::Migration[8.1]
  def change
    create_table :chapters do |t|
      t.string :title
      t.text :description
      t.datetime :start_date
      t.datetime :end_date
      t.boolean :published

      t.timestamps
    end
  end
end
