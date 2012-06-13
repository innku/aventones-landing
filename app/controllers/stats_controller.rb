class StatsController < ApplicationController
  layout 'stats'

  USERS = { "veamos" => "lasestadisticas" }

  before_filter :authenticate

  def index
    @surveys = Survey.order('id DESC')
  end


  private

  def authenticate
    authenticate_or_request_with_http_digest do |username|
      USERS[username]
    end
  end
end
