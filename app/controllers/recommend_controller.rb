class RecommendController < ApplicationController

  def index
    @sina_statuses = SinaStatus.find(:all, :limit => 10 , :offset => 0)
    @sina_users = SinaUser.find(:all)

    @other_statuses = SinaStatus.find(:all, :limit => 10 , :offset => 5)
  end
end
