class ApplicationController < ActionController::Base
  add_flash_types :danger, :info, :warning, :success
  view_helper SimpleSidebar::ApplicationViewHelper, as: :simple_sidebar_helper
end
