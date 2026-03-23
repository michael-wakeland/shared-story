class Chapter < ApplicationRecord
  has_many :story_threads, dependent: :destroy
  
  scope :ordered, -> { order(start_date: :asc) }

  after_create_commit -> { broadcast_append_to "timeline", target: "chapters_year_#{start_date&.year || Date.today.year}", partial: "chapters/chapter", locals: { chapter: self } }
  after_update_commit -> { broadcast_replace_to "timeline", target: "chapter_#{id}", partial: "chapters/chapter", locals: { chapter: self } }
  after_destroy_commit -> { broadcast_remove_to "timeline", target: "chapter_#{id}" }
end
