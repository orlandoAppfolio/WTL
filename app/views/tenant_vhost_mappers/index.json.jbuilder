json.array!(@tenant_vhost_mappers) do |tenant_vhost_mapper|
  json.extract! tenant_vhost_mapper, :id, :vhost, :email
  json.url tenant_vhost_mapper_url(tenant_vhost_mapper, format: :json)
end
