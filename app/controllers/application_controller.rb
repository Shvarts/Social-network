class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_filter :save_visit
  include SessionsHelper
  
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url 	
  end

	before_filter do
      resource = controller_name.singularize.to_sym
      method = "#{resource}_params"
      params[resource] &&= send(method) if respond_to?(method, true)
  	end

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

