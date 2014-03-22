class ServicesController < ApplicationController
  def index

  end

  def create
    omniauth = request.env['omniauth.auth']

    if omniauth && params[:service]

    service_route =params[:service]

    if service_route =='facebook'

      omniauth['extra']['raw_info']['email'] ? email = omniauth['extra']['raw_info']['email'] : email = ''
      omniauth['extra']['raw_info']['first_name'] ? first_name = omniauth['extra']['raw_info']['first_name'] : first_name = ''
      omniauth['extra']['raw_info']['last_name'] ? last_name = omniauth['extra']['raw_info']['last_name'] : last_name = ''
      omniauth['extra']['raw_info']['id'] ? uid = omniauth['extra']['raw_info']['id'] : uid = ''
      omniauth['provider'] ? provider = omniauth['provider'] : provider = ''

      render :text => uid.to_s + " - " +email+ " - "+first_name + " - "+last_name+ "- "+ provider

    elsif service_route == 'twitter'
      render :text => omniauth.to_yaml

    elsif service_route == ':google_oauth2'
      render :text => omniauth.to_yaml

    else


      render :text =>  'Error: omniauth is empty'
    end

end

  end


 end