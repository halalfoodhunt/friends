require 'test_helper'

class RegistrationsControllerTest < ActionController::TestCase
  setup do
    @registration = registrations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:registrations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create registration" do
    assert_difference('Registration.count') do
      post :create, registration: { contact_number: @registration.contact_number, date_of_birth: @registration.date_of_birth, email: @registration.email, facebook_ads: @registration.facebook_ads, facebook_newsfeed: @registration.facebook_newsfeed, facebook_video: @registration.facebook_video, ic_number: @registration.ic_number, instagram: @registration.instagram, instagram_account: @registration.instagram_account, name: @registration.name }
    end

    assert_redirected_to registration_path(assigns(:registration))
  end

  test "should show registration" do
    get :show, id: @registration
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @registration
    assert_response :success
  end

  test "should update registration" do
    patch :update, id: @registration, registration: { contact_number: @registration.contact_number, date_of_birth: @registration.date_of_birth, email: @registration.email, facebook_ads: @registration.facebook_ads, facebook_newsfeed: @registration.facebook_newsfeed, facebook_video: @registration.facebook_video, ic_number: @registration.ic_number, instagram: @registration.instagram, instagram_account: @registration.instagram_account, name: @registration.name }
    assert_redirected_to registration_path(assigns(:registration))
  end

  test "should destroy registration" do
    assert_difference('Registration.count', -1) do
      delete :destroy, id: @registration
    end

    assert_redirected_to registrations_path
  end
end
