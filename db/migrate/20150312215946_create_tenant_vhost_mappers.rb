class CreateTenantVhostMappers < ActiveRecord::Migration
  def change
    create_table :tenant_vhost_mappers do |t|
      t.string :vhost
      t.string :email

      t.timestamps
    end
  end
end
