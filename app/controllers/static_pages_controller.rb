class StaticPagesController < ApplicationController

  def home
    if logged_in?
      @feed_items = current_user.organisation.team_members
    end
  end

  def help
  end

  def about
  end

  def contact
  end

end
