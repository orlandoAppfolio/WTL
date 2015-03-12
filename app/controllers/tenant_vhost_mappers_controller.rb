class TenantVhostMappersController < ApplicationController
  def index
  end


  def create
    if params[:tenant_vhost_mapper][:email].present?
      email = params[:tenant_vhost_mapper][:email]
      tenant_vhost_mapper = TenantVhostMapper.new(email: email)
      vhosts = tenant_vhost_mapper.find_vhosts
      links = tenant_vhost_mapper.find_login_links
      if !links.present?
        render text: "sorry can not find your email: #{email}"
      elsif links.size == 1
        return redirect_to links.first
      else
        #handle multiple vhosts cases
        @email = email
        @vhosts = vhosts
      end
    elsif params[:tenant_vhost_mapper][:vhost].present?
      vhost = params[:tenant_vhost_mapper][:vhost]
      tenant_vhost_mapper = TenantVhostMapper.new(vhost: vhost)
      return redirect_to tenant_vhost_mapper.find_vhost_link
    else
      render text: 'forget to input anything?'
    end
  end

  def second_step
    return redirect_to params[:link]
  end

end
