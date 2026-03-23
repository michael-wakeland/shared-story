class StoryThread < ApplicationRecord
  belongs_to :chapter
  has_many :entries, dependent: :destroy
end
