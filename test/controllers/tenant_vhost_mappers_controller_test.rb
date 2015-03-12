require 'test_helper'

class TenantVhostMappersControllerTest < ActionController::TestCase
  setup do
    @tenant_vhost_mapper = tenant_vhost_mappers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tenant_vhost_mappers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tenant_vhost_mapper" do
    assert_difference('TenantVhostMapper.count') do
      post :create, tenant_vhost_mapper: { email: @tenant_vhost_mapper.email, vhost: @tenant_vhost_mapper.vhost }
    end

    assert_redirected_to tenant_vhost_mapper_path(assigns(:tenant_vhost_mapper))
  end

  test "should show tenant_vhost_mapper" do
    get :show, id: @tenant_vhost_mapper
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tenant_vhost_mapper
    assert_response :success
  end

  test "should update tenant_vhost_mapper" do
    patch :update, id: @tenant_vhost_mapper, tenant_vhost_mapper: { email: @tenant_vhost_mapper.email, vhost: @tenant_vhost_mapper.vhost }
    assert_redirected_to tenant_vhost_mapper_path(assigns(:tenant_vhost_mapper))
  end

  test "should destroy tenant_vhost_mapper" do
    assert_difference('TenantVhostMapper.count', -1) do
      delete :destroy, id: @tenant_vhost_mapper
    end

    assert_redirected_to tenant_vhost_mappers_path
  end
end
