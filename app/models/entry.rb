class Entry < ApplicationRecord
  belongs_to :story_thread
  belongs_to :user

  after_create_commit -> { broadcast_update_to "timeline", target: "chapter_#{story_thread.chapter.id}_latest_entry", html: "New entry added by #{user.email_address}" }
end
