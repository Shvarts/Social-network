class ServicesController < ApplicationController
 skip_before_filter :authenticate_user!, :except => [:create]


  def index

    # get all authentication services assigned to the current user
    @services = current_user.services.all

  end

  def destroy
    @service = current_user.services.find(params[:id])
    if current_user.services.length > 1
      @service.destroy
    else
      flash[:error] = 'Can\'t destroy last service.'
    end
    redirect_to services_path

  end

  def create
    @email=params[:email]
    @service=params[:service]
    @firstname=params[:firsrname]
    @lastname=params[:lastname]
    @uid=params[:uid]
    @provider =params[:provider]


    omniauth = request.env['omniauth.auth']

    if omniauth && params[:service]

    service_route =params[:service]

    if service_route =='facebook'

      omniauth['extra']['raw_info']['email'] ? @email = omniauth['extra']['raw_info']['email'] : @email = ''
      omniauth['extra']['raw_info']['first_name'] ? @firstname = omniauth['extra']['raw_info']['first_name'] : @firstname = ''
      omniauth['extra']['raw_info']['last_name'] ? @lastname = omniauth['extra']['raw_info']['last_name'] : @lastname = ''
      omniauth['extra']['raw_info']['id'] ? @uid = omniauth['extra']['raw_info']['id'] : @uid = ''
      omniauth['provider'] ? @provider = omniauth['provider'] : @provider = ''

      puts @provider
      puts @uid
      puts @email
      puts @firstname
      puts @lastname


      render :text => @uid.to_s + " - " +@email+ " - "+@firstname + " - "+@lastname+ "- "+ @provider

    elsif service_route == 'twitter'
      @email = ''
      @name = omniauth['info']['nickname'] || ''
      @firstname = omniauth['info']['nickname'] || ''
      @lastname = omniauth['info']['nickname'] || ''
      @twitter_link = omniauth['info']['urls']['Twitter'] || ''
      omniauth['uid'] ?  @uid =  omniauth['uid'] : @uid = ''
      omniauth['provider'] ? @provider =  omniauth['provider'] : @provider = ''

      render :text => @uid.to_s + " - " +@email+ " - "+@firstname + " - "+@lastname+ "- "+ @provider+"-"+@twitter_link

    elsif service_route == 'google'

      @firstname = omniauth['info']['name'] || ''
      @lastname = omniauth['info']['name'] || ''
      omniauth['info']['uid'] ?  @uid =  omniauth['info']['uid'] : @uid = ''
      omniauth['info']['uid'] ?  @email =  omniauth['info']['uid'] : @email = ''
      omniauth['provider'] ? @provider =  omniauth['provider'] : @provider = ''


      render :text => @uid.to_s + " - " +@email+ " - "+@firstname + " - "+@lastname+ "- "+ @provider

    else


      render :text =>  'Error: omniauth is empty'
    end

end

  end


 end