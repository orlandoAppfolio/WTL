class TenantVhostMapper < ActiveRecord::Base
  def self.find_login_link(email: )
    tenant = TenantVhostMapper.find_by_email(email)
    link = "https://#{tenant.vhost}.appfolio.com/connect/users/sign_in"
  end

  def self.find_vhost_link(vhost: )
    link = "https://#{vhost}.appfolio.com/connect/users/sign_in"
  end

  #handle lists of users case
  def self.find_login_links(email: )
    tenants = self.where(email: email)
    links = tenants.map(&:to_link)
  end

  def to_link
    "https://#{vhost}.appfolio.com/connect/users/sign_in"
  end

end
