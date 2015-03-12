class TenantVhostMapper < ActiveRecord::Base
  def initialize(email:'', vhost:'')
    @email = email
    @vhost = vhost
  end

  def find_vhost_link
    link = "https://#{@vhost}.appfolio.com/connect/users/sign_in"
  end

  def find_login_links
    tenants = TenantVhostMapper.where(email: @email)
    links = tenants.map{|tenant| tenant.to_link(@email) }
  end

  def to_link(email)
    "https://#{vhost}.appfolio.com/connect/users/sign_in?user[email]=#{email}"
  end

  def self.to_link(vhost, email='')
    "https://#{vhost}.appfolio.com/connect/users/sign_in?user[email]=#{email}"
  end

  def find_vhosts
    tenants = TenantVhostMapper.where(email: @email)
    vhosts = tenants.map(&:vhost)
  end

end
