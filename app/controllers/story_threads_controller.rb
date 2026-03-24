class StoryThreadsController < ApplicationController
  def show
    @story_thread = StoryThread.includes(entries: :user).find(params[:id])
    @chapter = @story_thread.chapter
  end
end
