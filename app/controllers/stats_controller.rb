class StatsController < ApplicationController
  layout 'stats'

  USERS = { "lifo" => "world" }

  before_filter :authenticate

  def index
    @surveys = Survey.all
  end


  private

  def authenticate
    authenticate_or_request_with_http_digest do |username|
      USERS[username]
    end
  end
end
