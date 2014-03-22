class ServicesController < ApplicationController
  def index

  end

  def create
    omniauth = request.env['omniauth.auth']

    if omniauth

      omniauth['extra']['raw_info']['email'] ? email = omniauth['extra']['raw_info']['email'] : email = ''
      omniauth['extra']['raw_info']['first_name'] ? first_name = omniauth['extra']['raw_info']['first_name'] : first_name = ''
      omniauth['extra']['raw_info']['last_name'] ? last_name = omniauth['extra']['raw_info']['last_name'] : last_name = ''
      omniauth['extra']['raw_info']['id'] ? uid = omniauth['extra']['raw_info']['id'] : uid = ''
      omniauth['provider'] ? provider = omniauth['provider'] : provider = ''

      render :text => uid.to_s + " - " +email+ " - "+first_name + " - "+last_name+ "- "+ provider

    else

      render :text =>  'Error: omniauth is empty'
    end



  end


 end