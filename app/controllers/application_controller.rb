class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session

  before_filter :save_visit
  include SessionsHelper

private

	def save_visit
		ua = AgentOrange::UserAgent.new(request.user_agent)
		browser = ua.device.engine.browser
		os = ua.device.operating_system
		device = ua.device
		visit = Visit.create(ip: request.ip, browser_name: browser.name,  
			browser_version: browser.version.to_s, os_name: os.name, os_version: os.version.to_s, devise_type: device.type)
	end

end

