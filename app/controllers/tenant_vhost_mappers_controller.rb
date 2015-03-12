class TenantVhostMappersController < ApplicationController
  def index
  end


  def create
    if params[:tenant_vhost_mapper][:email].present?
    return redirect_to TenantVhostMapper.find_login_link(email: params[:tenant_vhost_mapper][:email])
    elsif params[:tenant_vhost_mapper][:vhost].present?
    return redirect_to TenantVhostMapper.find_vhost_link(vhost: params[:tenant_vhost_mapper][:vhost])
    else
      render text: 'forget to input anything?'
    end
  end

end
