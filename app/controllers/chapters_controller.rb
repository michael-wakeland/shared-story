class ChaptersController < ApplicationController
  def show
    @chapter = Chapter.find(params[:id])
    @story_threads = @chapter.story_threads.includes(:entries)
  end

  def new
    @chapter = Chapter.new
  end

  def create
    @chapter = Chapter.new(chapter_params)
    
    if @chapter.save
      respond_to do |format|
        format.html { redirect_to timeline_path, notice: "Chapter created successfully." }
        format.turbo_stream
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def chapter_params
    params.require(:chapter).permit(:title, :description, :start_date, :end_date, :published)
  end
end
