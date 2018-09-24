class UsersRankingController < ApplicationController
  def index
    @ranking = User.joins(:comments).where("comments.updated_at > ?", "#{Date.today.days_ago(7)}%").group(:name).order('count_id DESC').count(:id).take(10) 
  end
end
