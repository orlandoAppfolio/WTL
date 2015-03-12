class TenantVhostMappersController < ApplicationController
  def index
  end


  def create
    if params[:tenant_vhost_mapper][:email].present?
      vhosts = TenantVhostMapper.find_vhosts(email: params[:tenant_vhost_mapper][:email])
      links = TenantVhostMapper.find_login_links(email: params[:tenant_vhost_mapper][:email])
      if !links.present?
        render 'sorry can not find your email'
      elsif links.size == 1
        return redirect_to links.first
      else
        #handle multiple vhosts cases
        @vhosts = vhosts
      end
    elsif params[:tenant_vhost_mapper][:vhost].present?
      return redirect_to TenantVhostMapper.find_vhost_link(vhost: params[:tenant_vhost_mapper][:vhost])
    else
      render text: 'forget to input anything?'
    end
  end

  def second_step
    return redirect_to params[:link]
  end

end
