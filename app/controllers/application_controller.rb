class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_filter :save_visit
  include SessionsHelper

private
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

	def save_visit
		ua = AgentOrange::UserAgent.new(request.user_agent)
		browser = ua.device.engine.browser
		os = ua.device.operating_system
		device = ua.device
		visit = Visit.create(ip: request.ip, browser_name: browser.name,  
			browser_version: browser.version.to_s, os_name: os.name, os_version: os.version.to_s, devise_type: device.type)
	end

end

