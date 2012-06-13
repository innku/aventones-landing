class StatsController < ApplicationController
  layout 'stats'

  def index
    @surveys = Survey.all
  end
end
