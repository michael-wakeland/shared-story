class CreateStoryThreads < ActiveRecord::Migration[8.1]
  def change
    create_table :story_threads do |t|
      t.references :chapter, null: false, foreign_key: true
      t.string :title
      t.integer :status

      t.timestamps
    end
  end
end
