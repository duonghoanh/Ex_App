class StaticPagesController < ApplicationController
  def home
  end

  def help
  end
  def contact
    # get contact_path
# assert_response :success
# assert_select "title", "Contact | Ruby on Rails Tutorial Sample App"
  end
end
