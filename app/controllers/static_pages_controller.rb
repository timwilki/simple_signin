class StaticPagesController < ApplicationController

  def home
      @feed_items = current_user.organisation.team_members if logged_in?
  end

  def help
  end

  def about
  end

  def contact
  end

end
