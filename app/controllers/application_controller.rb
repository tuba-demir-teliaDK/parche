class ApplicationController < ActionController::Base
 protect_from_forgery
 #before_filter :authenticate_user!
 
 before_filter :mailer_set_url_options
 
 #db/*.sqlite3
  def mailer_set_url_options
    ActionMailer::Base.default_url_options[:host] = request.host_with_port
  end
end
