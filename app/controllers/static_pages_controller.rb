class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @micropost = current_user.microposts.build
      @feed_items = current_user.feed.page(params[:page])
    end

  end

  def help
  end

  def contact
    # get contact_path
    # assert_response :success
    # assert_select "title", "Contact | Ruby on Rails Tutorial Sample App"
  end
end
