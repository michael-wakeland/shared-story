class TimelineController < ApplicationController
  def index
    @chapters_by_year = Chapter.ordered.group_by { |c| c.start_date&.year || Date.today.year }
  end
end
